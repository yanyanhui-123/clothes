import 'package:get/get.dart';
import 'package:yyh_clothes/common/index.dart';

class SplashController extends GetxController {
  SplashController();

  void _jumpToPage() {
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Get.offAllNamed(RouteNames.systemMain);
    });
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _jumpToPage();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
