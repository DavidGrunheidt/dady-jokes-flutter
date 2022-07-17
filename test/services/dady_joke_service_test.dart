import 'package:dady_jokes_app/data/services/dady_joke_service.dart';
import 'package:dady_jokes_app/data/services/http_client/dady_joke_http_client.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixtures.dart';
import 'dady_joke_service_test.mocks.dart';

@GenerateMocks([
  DadyJokeHttpClient,
])
void main() {
  group('DadyJokeRepository', () {
    final mockDadyJokeHttpClient = MockDadyJokeHttpClient();

    setUpAll(() async {
      Get.put<DadyJokeHttpClient>(mockDadyJokeHttpClient, permanent: true);
    });

    tearDown(() {
      reset(mockDadyJokeHttpClient);
    });

    tearDownAll(() async {
      await Get.deleteAll();
    });

    test('getJoke returns DadyJoke', () async {
      const jokeId = '0189hNRf2g';
      const path = '${DadyJokeService.jokeIdPath}/$jokeId';
      final dadyJokeResp = fixture('dady_joke_resp.json');

      Future<dio.Response> getJoke() => mockDadyJokeHttpClient.get<Map<String, dynamic>>(path);
      when(getJoke()).thenAnswer((_) async {
        return dio.Response<Map<String, dynamic>>(requestOptions: dio.RequestOptions(path: path), data: dadyJokeResp);
      });

      final dadyJokeService = DadyJokeService();
      final dadyJoke = await dadyJokeService.getJoke(id: jokeId);

      expect(dadyJoke.id, dadyJokeResp['id']);
      expect(dadyJoke.content, dadyJokeResp['joke']);
      verify(getJoke());
      verifyNoMoreInteractions(mockDadyJokeHttpClient);
    });

    test('loadJokes with no params passed returns list with 10 jokes', () async {
      final dadyJokesResp = fixture('dady_jokes_resp.json');
      const path = DadyJokeService.searchJokePath;
      Future<dio.Response> loadJokes() {
        return mockDadyJokeHttpClient.get<Map<String, dynamic>>(path, queryParameters: {'limit': 10});
      }

      when(loadJokes()).thenAnswer((_) async {
        return dio.Response<Map<String, dynamic>>(requestOptions: dio.RequestOptions(path: path), data: dadyJokesResp);
      });

      final dadyJokeService = DadyJokeService();
      final dadyJokes = await dadyJokeService.loadJokes();

      expect(dadyJokes.results.length, 10);
      expect(dadyJokes.searchTerm, '');
      expect(dadyJokes.results.first.id, (dadyJokesResp['results'] as List).first['id']);
      expect(dadyJokes.results.last.id, (dadyJokesResp['results'] as List).last['id']);
      verify(loadJokes());
      verifyNoMoreInteractions(mockDadyJokeHttpClient);
    });

    test('loadJokes with param limit = 5 and term = mom returns list with 5 jokes', () async {
      const term = 'mom';
      const path = DadyJokeService.searchJokePath;
      final dadyJokesResp = fixture('dady_jokes_resp2.json');
      Future<dio.Response> loadJokes() {
        return mockDadyJokeHttpClient.get<Map<String, dynamic>>(path, queryParameters: {'term': term, 'limit': 5});
      }

      when(loadJokes()).thenAnswer((_) async {
        return dio.Response<Map<String, dynamic>>(requestOptions: dio.RequestOptions(path: path), data: dadyJokesResp);
      });

      final dadyJokeService = DadyJokeService();
      final dadyJokes = await dadyJokeService.loadJokes(limit: 5, term: term);

      expect(dadyJokes.results.length, 5);
      expect(dadyJokes.searchTerm, term);
      expect(dadyJokes.results.first.id, (dadyJokesResp['results'] as List).first['id']);
      expect(dadyJokes.results.last.id, (dadyJokesResp['results'] as List).last['id']);
      verify(loadJokes());
      verifyNoMoreInteractions(mockDadyJokeHttpClient);
    });

    test('loadJokes with param term = lol returns no jokes', () async {
      const term = 'lol';
      const path = DadyJokeService.searchJokePath;
      final dadyJokesResp = fixture('dady_jokes_resp3.json');
      Future<dio.Response> loadJokes() {
        return mockDadyJokeHttpClient.get<Map<String, dynamic>>(path, queryParameters: {
          'term': term,
          'limit': 10,
        });
      }

      when(loadJokes()).thenAnswer((_) async {
        return dio.Response<Map<String, dynamic>>(requestOptions: dio.RequestOptions(path: path), data: dadyJokesResp);
      });

      final dadyJokeService = DadyJokeService();
      final dadyJokes = await dadyJokeService.loadJokes(term: term);

      expect(dadyJokes.results.isEmpty, true);
      expect(dadyJokes.searchTerm, term);
      verify(loadJokes());
      verifyNoMoreInteractions(mockDadyJokeHttpClient);
    });
  });
}
