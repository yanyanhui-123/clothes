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
    double? elevation = 0,
    List<Widget>? actions,
    double? leadingWidth,
    Color titleColor = Colors.black}) {
  return AppBar(
      leading: null,
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
      elevation: elevation ?? 0,
      bottom: bottom);
}
