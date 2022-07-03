import '../../core/utils/base_getx_controller.dart';

class SplashScreenController extends BaseGetxController {
  void Function() onIsVisitor;
  void Function() onIsUser;

  SplashScreenController({
    required this.onIsVisitor,
    required this.onIsUser,
  });

  @override
  Future<void> onInit() async {
    loading.value = true;

    final isUser = await Future<bool>.delayed(const Duration(seconds: 2), () => true);
    super.onInit();

    isUser ? onIsUser() : onIsVisitor();
  }
}
