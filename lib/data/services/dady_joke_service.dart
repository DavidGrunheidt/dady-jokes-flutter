import 'dart:math';

import 'package:get/get.dart';

import '../model/dady_joke/dady_joke.dart';
import '../model/dady_joke/dady_jokes_response.dart';
import 'http_client/base_http_service.dart';
import 'http_client/dady_joke_http_client.dart';

class DadyJokeService {
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

  Future<DadyJoke> getJoke({required String id}) async {
    final resp = await _httpClient.get<Map<String, dynamic>>('$jokeIdPath/$id');
    return DadyJoke.fromJson(_buildJokeWithMissingFields(resp.data!));
  }

  Future<DadyJokesResponse> loadJokes({int? page, String? term, int limit = 10}) async {
    final queryParams = {
      if (page != null) 'page': page,
      if (term != null) 'term': term,
      'limit': limit,
    };

    final resp = await _httpClient.get<Map<String, dynamic>>(searchJokePath, queryParameters: queryParams);
    return DadyJokesResponse.fromJson(resp.data!);
  }
}
