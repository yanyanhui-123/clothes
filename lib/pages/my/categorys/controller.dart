import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/api/categorys.dart';
import 'package:yyh_clothes/common/database/models/category.dart';
import 'package:yyh_clothes/common/index.dart';

class CategorysController extends GetxController {
  CategorysController();
  bool isSelect = Get.arguments != null ? Get.arguments[0] : false;

  List<Category> categorys = [];
  Category? selectedCategory;

  Future getCateList() async {
    categorys = await CategorysApi().getCateList();
    update(["categorys"]);
  }

  onOpenAddCate(bool isAdd, {Category? item}) async {
      final controller = TextEditingController(text: item?.name ?? "");
      await Get.dialog(
        ActionDialog.getCustomConfirmDialog(
          title: isAdd ? "新增分类" : "编辑分类",
          icon: Icons.info,
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "请输入分类名称",
            ),
          ),
          onConfirm: () async {
            final newText = controller.text.trim();
            if (newText.isNotEmpty) {
              final name = controller.text.trim();
              if (name.isEmpty) return;
              if (isAdd) {
                await CategorysApi().addCate(name, categorys.length);
              } else {
                await CategorysApi().editCate(name, item!);
              }
              await getCateList();
            }
          }
        )
      );
  }

  Future deleteCategory(Category item) async {
    await Get.dialog(
      ActionDialog.getConfirmDialog(
        content: "确定要删除 ${item.name} 吗？",
        onConfirm: () async {
          await CategorysApi().deleteCate(item);
          await getCateList();
          Get.back();
        }
      )
    );
  }

  Future reSortCategory(int newIndex, int oldIndex) async {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    final item = categorys.removeAt(oldIndex);

    categorys.insert(newIndex, item);

    await CategorysApi().reSortCate(categorys);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() async {
    super.onReady();
    await getCateList();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
