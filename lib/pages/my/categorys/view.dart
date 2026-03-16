import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/components/appbar.dart';

import 'index.dart';

class CategorysPage extends GetView<CategorysController> {
  const CategorysPage({super.key});

  // 主视图
  Widget _buildView() {
    return ReorderableListView.builder(
      itemCount: controller.categorys.length,
      onReorder: (int oldIndex, int newIndex) {
        controller.reSortCategory(oldIndex, newIndex);
      },
      itemBuilder: (context, index) {
        final item = controller.categorys[index];
        return Padding(
          key: ValueKey(item.id),
          padding: EdgeInsets.symmetric(vertical: 5.h),
          /// 只拖动这个卡片
          child: Material(
            borderRadius: BorderRadius.circular(12.r),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
              leading: controller.isSelect ? (
                controller.selectedCategory?.id == item.id ?  const Icon(Icons.select_all_sharp) : const Icon(Icons.circle_outlined)
              ) : const Icon(Icons.drag_indicator_outlined),
              title: Text(
                item.name,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              tileColor: Colors.white,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, size: 20),
                    onPressed: () => controller.onOpenAddCate(false, item: item),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, size: 20),
                    onPressed: () => controller.deleteCategory(item),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategorysController>(
      init: CategorysController(),
      id: "categorys",
      builder: (_) {
        return Scaffold(
          appBar: primaryAppBar(
            title: "分类管理",
            actions: [
              IconButton(
                icon: const Icon(Icons.add_box_rounded),
                onPressed: () {
                  controller.onOpenAddCate(true);
                },
              ),
            ],
          ),
          body: SafeArea(
            child: _buildView().paddingSymmetric(horizontal: 12.w, vertical: 10.h),
          ),
        );
      },
    );
  }
}
