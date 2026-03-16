import 'dart:io';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yyh_clothes/common/api/clothes.dart';
import 'package:yyh_clothes/common/api/clothesStats.dart';
import 'package:yyh_clothes/common/api/user.dart';
import 'package:yyh_clothes/common/database/index.dart';
import 'package:yyh_clothes/common/index.dart';

class MineController extends GetxController {
  MineController();

  var avatar = "".obs;
  var userName = "".obs;
  var desc = "".obs;
  var total = 0.obs;
  var catesTotal = [].obs;
  var frequentlyClothes = [].obs; 
  User? user;
  

  _initData() async {
    user = await UserApi().getUserInfo();
    getStatistics();
    avatar.value = user?.avatar ?? "";
    userName.value = user?.name ?? "";
    desc.value = user?.desc ?? "";
    update(["mine"]);
  }


  void onChangeUserName(String value) async{
    if (user != null) {
      await UserApi().changeUserName(user!, value);
      userName.value = value;
    }
  }

  void onChangeUserDesc(String value) async{
    if (user != null) {
      await UserApi().changeUserDesc(user!, value);
      desc.value = value;
    }
  }

  void getStatistics() async {
    final stats = await ClothesApi().getClothesStats();
    total.value = stats.total;
    catesTotal.value = stats.top3;
  }

  void toAddCate() {
    Get.toNamed(RouteNames.myCategory);
  }


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
