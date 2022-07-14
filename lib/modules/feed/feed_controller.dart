import 'package:get/get.dart';

import '../../core/utils/base_getx_controller.dart';
import '../../data/model/dady_joke/dady_joke.dart';
import '../../data/repositores/dady_joke_repository.dart';

class FeedController extends BaseGetxController {
  final _dadyJokeRepository = Get.find<DadyJokeRepository>();

  final RxInt totalJokes = 0.obs;
  final RxBool noResults = false.obs;

  @override
  Future<void> onInit() async {
    loading.value = true;

    _dadyJokeRepository.searchedDadyJokes.stream.listen((event) => totalJokes.value = event.length + 1);
    _dadyJokeRepository.lastDadyJokesResp.stream.listen((event) {
      noResults.value = event.currentPage == 1 && event.results.isEmpty;
    });

    await loadJokes();
    super.onInit();
  }

  Future<void> loadJokes({String term = ''}) async {
    loading.value = true;
    await _dadyJokeRepository.searchJokes(term: term);
    loading.value = false;
  }

  void onJokeChanged(int index, {String searchingTerm = ''}) {
    final isLastJokeOfPage = index == (totalJokes.value - 1);
    final isLastJokeOfAll = index == _dadyJokeRepository.lastDadyJokesResp.value.totalJokes;
    if (isLastJokeOfPage && !isLastJokeOfAll) loadJokes(term: searchingTerm);
  }

  bool showNoMoreContentMsg(int index) => index != 0 && index == _dadyJokeRepository.lastDadyJokesResp.value.totalJokes;

  DadyJoke? getJokeAtIndex(int index) {
    if (_dadyJokeRepository.searchedDadyJokes.length <= index) return null;
    return _dadyJokeRepository.searchedDadyJokes.elementAt(index);
  }
}
