import 'package:get/get.dart';

class ClothesController extends GetxController {
  ClothesController();

  _initData() {
    update(["clothes"]);
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
