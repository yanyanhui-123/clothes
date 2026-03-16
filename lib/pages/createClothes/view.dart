import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/components/appbar.dart';
import 'package:yyh_clothes/pages/createClothes/widgets/uploadClothes.dart';

import 'index.dart';

class CreateclothesPage extends GetView<CreateclothesController> {
  const CreateclothesPage({super.key});

  // 主视图
  Widget _buildView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(),

            UploadClothesWidget(
              onChange: (String path) {
                print("path $path");
              },
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateclothesController>(
      init: CreateclothesController(),
      id: "createclothes",
      builder: (_) {
        return Scaffold(
          appBar: primaryAppBar(
            title: "新增服饰"
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
