import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/api/categorys.dart';
import 'package:yyh_clothes/common/database/models/category.dart';

class ClothesController extends GetxController {
  ClothesController();

  List<Category> categorys = [];
  var isFinish = false.obs;

  Future getCateList() async {
    categorys = await CategorysApi().getCateList();
    
    isFinish.value = true;
    update(["clothes"]);
  }


  @override
  void onInit() async {
    super.onInit();
    await getCateList();
  }

  @override
  void onReady() async {
    super.onReady();
    
  }

  @override
  void onClose() {
    super.onClose();
  }
}
