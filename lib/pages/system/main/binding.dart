import 'package:get/get.dart';
import 'package:yyh_clothes/pages/index.dart';

/// 主界面依赖
class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<MainController>(MainController());
    Get.put<HomeController>(HomeController());
  }
}
