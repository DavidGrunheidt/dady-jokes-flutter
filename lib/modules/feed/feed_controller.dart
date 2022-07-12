import 'package:get/get.dart';

import '../../core/utils/base_getx_controller.dart';
import '../../data/model/dady_joke/dady_joke.dart';
import '../../data/repositores/dady_joke_repository.dart';

class FeedController extends BaseGetxController {
  final _dadyJokeRepository = Get.find<DadyJokeRepository>();

  final RxInt totalJokes = 0.obs;

  @override
  Future<void> onInit() async {
    loading.value = true;
    totalJokes.value = _dadyJokeRepository.dadyJokes.length + 1;
    _dadyJokeRepository.dadyJokes.stream.listen((event) => totalJokes.value = event.length + 1);

    super.onInit();
  }

  Future<void> loadJokes() async {
    loading.value = true;
    await _dadyJokeRepository.loadJokes();
    loading.value = false;
  }

  void onJokeChanged(int index) {
    if (index == (totalJokes.value - 1)) {
      _dadyJokeRepository.loadJokes();
    }
  }

  DadyJoke? getJokeAtIndex(int index) {
    if (_dadyJokeRepository.dadyJokes.length <= index) return null;
    return _dadyJokeRepository.dadyJokes.elementAt(index);
  }
}
