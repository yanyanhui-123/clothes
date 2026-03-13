import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/pages/my/mine/widgets/avatar.dart';
import 'package:yyh_clothes/pages/my/mine/widgets/edit_able_text.dart';

import 'index.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  State<MinePage> createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MineViewGetX();
  }
}

class _MineViewGetX extends GetView<MineController> {
  const _MineViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AvatarWidget(initialAvatar: controller.avatar.value),
          EditableTextWidget(
            text: controller.userName.value.isEmpty ? "请输入昵称" : controller.userName.value, 
            isEditable: controller.userName.value.isEmpty,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600, 
              color: AppColors.color_333333),
            onChanged: (value) {
              controller.onChangeUserName(value);
            }
          ).marginOnly(top: 10.w),
          EditableTextWidget(
            text: controller.desc.value.isEmpty ? "这个家伙很懒，什么都没留下" : controller.desc.value, 
            isEditable: controller.desc.value.isEmpty,
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.color_999999),
            onChanged: (value) {
              controller.onChangeUserDesc(value);
            }
          ).marginOnly(top: 10.w),
          Row()
        ],
      ))
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (_) {
        return Scaffold(
          appBar: mainAppBar(
            title: "",
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
