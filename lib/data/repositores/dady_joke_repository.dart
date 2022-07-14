import 'package:get/get.dart';

import '../../core/utils/base_getx_controller.dart';
import '../model/dady_joke/dady_joke.dart';
import '../model/dady_joke/dady_jokes_response.dart';
import '../services/dady_joke_service.dart';

class DadyJokeRepository extends BaseGetxController {
  final _dadyJokesService = Get.find<DadyJokeService>();

  final RxList<DadyJoke> searchedDadyJokes = <DadyJoke>[].obs;
  final RxString lastTermSearched = ''.obs;

  final Rx<DadyJokesResponse> lastDadyJokesResp = DadyJokesResponse.empty().obs;

  Future<void> searchJokes({String term = ''}) async {
    if (term != lastTermSearched.value) {
      lastTermSearched.value = term;
      lastDadyJokesResp.value = DadyJokesResponse.empty();
      searchedDadyJokes.clear();
    }

    final jokesResp = await _dadyJokesService.loadJokes(page: lastDadyJokesResp.value.nextPage, term: term);
    lastDadyJokesResp.value = jokesResp;
    searchedDadyJokes.addAll(jokesResp.results);
  }
}
