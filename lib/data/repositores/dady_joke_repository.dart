import 'package:get/get.dart';

import '../../core/utils/base_getx_controller.dart';
import '../model/dady_joke/dady_joke.dart';
import '../model/dady_joke/dady_jokes_response.dart';
import '../services/dady_joke_service.dart';

class DadyJokeRepository extends BaseGetxController {
  final _dadyJokesService = Get.find<DadyJokeService>();

  final RxList<DadyJoke> dadyJokes = <DadyJoke>[].obs;
  final Rxn<DadyJokesResponse> lastDadyJokesResp = Rxn<DadyJokesResponse>();

  @override
  Future<void> onInit() async {
    await loadJokes();
    super.onInit();
  }

  Future<void> loadJokes({String? term}) async {
    final jokesResp = await _dadyJokesService.loadJokes(page: lastDadyJokesResp.value?.nextPage ?? 0);
    dadyJokes.addAll(jokesResp.results);
    lastDadyJokesResp.value = jokesResp;
  }
}
