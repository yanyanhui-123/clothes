import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/index.dart';

AppBar? mainAppBar(
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
    Color titleColor = Colors.white}) {
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
                color: titleColor),
          ),
      centerTitle: true,
      backgroundColor: backgroundColor ?? Colors.white,
      actions: actions,
      elevation: elevation ?? 1.8,
      bottom: bottom);
}
