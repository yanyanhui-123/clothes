import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/index.dart';

AppBar? primaryAppBar(
    {String? title,
    Widget? leading,
    Widget? titleWidget,
    Color? backgroundColor,
    Color? foregroundColor,
    VoidCallback? backAction,
    PreferredSizeWidget? bottom,
    double? elevation,
    List<Widget>? actions,
    double? leadingWidth,
    Color? titleColor}) {
  return AppBar(
      leading: leading ??
          Icon(Icons.arrow_back_ios, color: foregroundColor ?? Colors.black)
              .marginOnly(left: AppSpace.page)
              .unconstrained()
              .onTap(() {
            if (backAction == null) {
              Get.back();
            } else {
              backAction();
            }
          }),
      leadingWidth: leading == null ? 44.w : leadingWidth,
      title: titleWidget ??
          Text(
            title ?? "",
            style: TextStyle(
                fontSize: 19.sp,
                fontWeight: FontWeight.bold,
                color: titleColor ?? Color(0xff333333)),
          ),
      centerTitle: true,
      backgroundColor: backgroundColor ?? Colors.white,
      actions: actions,
      elevation: elevation ?? 0,
      bottom: bottom);
}
