import 'dart:math';

import 'package:get/get.dart';

import '../model/dady_joke/dady_joke.dart';
import '../model/dady_joke/dady_jokes_response.dart';
import 'http_client/base_http_service.dart';
import 'http_client/dady_joke_http_client.dart';

abstract class DadyJokeService {
  Future<DadyJoke> getJoke({required String id});

  Future<DadyJokesResponse> loadJokes({int? page, int? limit, String? term});
}

class DadyJokeServiceImpl extends GetxService implements DadyJokeService {
  final BaseHttpClient _httpClient = Get.find<DadyJokeHttpClient>();

  static const searchJokePath = '/search';
  static const jokeIdPath = '/j';

  // TODO(DavidGrunheidt): Temporarily. Should be removed after implementing Firebase Store
  Map<String, dynamic> _buildJokeWithMissingFields(Map<String, dynamic> respData) {
    int nextInt(int max) => Random().nextInt(max);
    return respData
      ..addAll({
        'numLikes': nextInt(100),
        'numDislikes': nextInt(30),
        'numFavorites': nextInt(10),
      });
  }

  @override
  Future<DadyJoke> getJoke({required String id}) async {
    final resp = await _httpClient.get('$jokeIdPath/$id');
    return DadyJoke.fromJson(_buildJokeWithMissingFields(resp.data));
  }

  @override
  Future<DadyJokesResponse> loadJokes({int? page, int? limit, String? term}) async {
    final queryParams = {'page': page, 'limit': limit, 'term': term};
    final resp = await _httpClient.get<Map<String, dynamic>>('$searchJokePath?', queryParameters: queryParams);
    return DadyJokesResponse.fromJson(resp.data!);
  }
}
