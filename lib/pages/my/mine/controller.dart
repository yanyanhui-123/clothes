import 'dart:io';

import 'package:get/get.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yyh_clothes/common/database/index.dart';

class MineController extends GetxController {
  MineController();

  var avatar = "".obs;
  var userName = "".obs;
  var desc = "".obs;
  var total = 0.obs;
  var catesTotal = [].obs;
  var frequentlyClothes = [].obs; 
  

  _initData() async {
    final isar = await IsarService().db;
    final user = await isar.users.where().findFirst();
    avatar.value = user?.avatar ?? "";
    userName.value = user?.name ?? "";
    desc.value = user?.desc ?? "";
    update(["mine"]);
  }


  void onChangeUserName(String value) async{
    final isar = await IsarService().db;
    final user = await isar.users.where().findFirst();
    if (user != null) {
      await isar.writeTxn(() async {
        user.name = value;
        await isar.users.put(user);
        userName.value = value;
      });
    }
  }

  void onChangeUserDesc(String value) async{
    final isar = await IsarService().db;
    final user = await isar.users.where().findFirst();
    if (user != null) {
      await isar.writeTxn(() async {
        user.desc = value;
        await isar.users.put(user);
        desc.value = value;
      });
    }
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
