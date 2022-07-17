import 'package:dady_jokes_app/data/model/dady_joke/dady_jokes_response.dart';
import 'package:dady_jokes_app/data/repositores/dady_joke_repository.dart';
import 'package:dady_jokes_app/data/services/dady_joke_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../fixtures/fixtures.dart';
import 'dady_joke_repository_test.mocks.dart';

@GenerateMocks([
  DadyJokeService,
])
void main() {
  group('DadyJokeRepository', () {
    final mockDadyJokeService = MockDadyJokeService();

    final dadyJokesResp = DadyJokesResponse.fromJson(fixture('dady_jokes_resp.json'));

    setUpAll(() async {
      Get.put<DadyJokeService>(mockDadyJokeService, permanent: true);
    });

    tearDown(() {
      reset(mockDadyJokeService);
    });

    tearDownAll(() async {
      await Get.deleteAll();
    });

    test('searchJokes with default term (empty string)', () async {
      Future<DadyJokesResponse> loadJokes() => mockDadyJokeService.loadJokes(page: 0, term: '');

      when(loadJokes()).thenAnswer((_) async => dadyJokesResp);

      final dadyJokeRepo = DadyJokeRepository();
      await dadyJokeRepo.searchJokes();

      expect(dadyJokeRepo.lastTermSearched.value, '');
      expect(dadyJokeRepo.lastDadyJokesResp.value, dadyJokesResp);
      expect(dadyJokeRepo.searchedDadyJokes.length, dadyJokesResp.results.length);
      verify(loadJokes());
      verifyNoMoreInteractions(mockDadyJokeService);
    });

    test('searchJokes with some term changes last term and loadJokes with page = 1', () async {
      const term = 'car';
      Future<DadyJokesResponse> loadJokes() => mockDadyJokeService.loadJokes(page: 1, term: term);

      when(loadJokes()).thenAnswer((_) async => dadyJokesResp);

      final dadyJokeRepo = DadyJokeRepository();
      await dadyJokeRepo.searchJokes(term: term);

      expect(dadyJokeRepo.lastTermSearched.value, term);
      expect(dadyJokeRepo.lastDadyJokesResp.value, dadyJokesResp);
      expect(dadyJokeRepo.searchedDadyJokes.length, dadyJokesResp.results.length);
      verify(loadJokes());
      verifyNoMoreInteractions(mockDadyJokeService);
    });
  });
}
