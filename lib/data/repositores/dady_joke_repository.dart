import 'package:get/get.dart';

import '../model/dady_joke/dady_joke.dart';
import '../model/dady_joke/dady_jokes_response.dart';
import '../services/dady_joke_service.dart';

class DadyJokeRepository {
  final _dadyJokesService = Get.find<DadyJokeService>();

  final RxList<DadyJoke> searchedDadyJokes = <DadyJoke>[].obs;
  final RxString lastTermSearched = ''.obs;

  final Rx<DadyJokesResponse> lastDadyJokesResp = const DadyJokesResponse.empty().obs;

  Future<void> searchJokes({String term = ''}) async {
    final termChanged = term != lastTermSearched.value;
    if (termChanged) {
      lastTermSearched.value = term;
      searchedDadyJokes.clear();
    }

    final nextPage = termChanged ? 1 : lastDadyJokesResp.value.nextPage;
    final jokesResp = await _dadyJokesService.loadJokes(page: nextPage, term: term);

    lastDadyJokesResp.value = jokesResp;
    searchedDadyJokes.addAll(jokesResp.results);
  }
}
