import 'package:get/get.dart';

class CreateclothesController extends GetxController {
  CreateclothesController();

  _initData() {
    update(["createclothes"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
