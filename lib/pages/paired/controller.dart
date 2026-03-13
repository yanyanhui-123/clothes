import 'package:get/get.dart';

class PairedController extends GetxController {
  PairedController();

  _initData() {
    update(["paired"]);
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
