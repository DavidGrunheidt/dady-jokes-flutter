import 'package:get/get.dart';

class BaseGetxController extends GetxController {
  final firstLoading = true.obs;
  late final loading = true.obs;

  @override
  void onInit() {
    firstLoading.value = false;
    loading.value = false;
    super.onInit();
  }
}
