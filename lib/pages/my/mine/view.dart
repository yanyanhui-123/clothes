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

  Widget totalView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f8),
        borderRadius: BorderRadius.circular(10.w)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          totalItem(isBorder: false),
          if(controller.catesTotal.isNotEmpty)
            ...controller.catesTotal.map((e) {
              return totalItem();
            }),
          if(controller.catesTotal.isEmpty)
            addCateBtn()
        ],

      ),
    );
  }

  Widget totalItem({bool isBorder = true}) {
    return Expanded(child: Container(
      decoration: BoxDecoration(
        border: isBorder ? Border(
          left: BorderSide(
            color: AppColors.color_eaeaea,
            width: 1.w
          ),
        ) : null
      ),
      child: Column(
        children: [
          Text("${controller.total}", style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.color_333333
          )),
          Text("总数量", style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.color_666666
          )).marginOnly(top: 8.h),
        ],
      ),
    ));
  }

  Widget frequentlyClothesView() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xfff7f7f8),
        borderRadius: BorderRadius.circular(10.w)
      ),
      child: Column(
        children: [
          Text("最近收藏", style: TextStyle(
            fontSize: 16.sp,
          ))
        ]
      )
    );
  }

  Widget addCateBtn() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: BorderSide(
              color: AppColors.color_eaeaea,
              width: 1.w
            ),
          )
        ),
        child: Column(
          children: [
            const Icon(Icons.add_box_rounded),
            Text("添加分类", style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.color_666666
            )).marginOnly(top: 8.h),
          ],
        ),
      ).onTap(() {
        controller.toAddCate();
      }),
    );
  }

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Obx(() => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AvatarWidget(initialAvatar: controller.avatar.value),
            EditableTextWidget(
              text: controller.userName.value.isEmpty ? "请输入昵称" : controller.userName.value, 
              title: "修改昵称",
              isEditable: controller.userName.value.isEmpty,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600, 
                color: AppColors.color_333333),
              onChanged: (value) {
                controller.onChangeUserName(value);
              }
            ).marginOnly(top: 10.w),
            EditableTextWidget(
              text: controller.desc.value.isEmpty ? "点击添加介绍，让大家认识你..." : controller.desc.value, 
              title: "修改简介",
              isEditable: controller.desc.value.isEmpty,
              style: TextStyle(
                fontSize: 14.sp,
                color: AppColors.color_999999),
              onChanged: (value) {
                controller.onChangeUserDesc(value);
              }
            ).marginOnly(top: 10.w),
            
            totalView().marginOnly(top: 20.w),
          ],
        )),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      id: "mine",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
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
