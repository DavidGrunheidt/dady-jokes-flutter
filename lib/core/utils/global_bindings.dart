import 'package:get/get.dart';

import '../../data/repositores/dady_joke_repository.dart';
import '../../data/services/dady_joke_service.dart';
import '../../data/services/http_client/dady_joke_http_client.dart';

class GlobalBindings extends Bindings {

  @override
  void dependencies() {
    Get.put<DadyJokeHttpClient>(DadyJokeHttpClient(), permanent: true);
    Get.put<DadyJokeService>(DadyJokeServiceImpl(), permanent: true);

    Get.put<DadyJokeRepository>(DadyJokeRepository(), permanent: true);
  }
}