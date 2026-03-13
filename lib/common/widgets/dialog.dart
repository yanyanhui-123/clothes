import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 对话框
class ActionDialog {
  static Future normal({
    required BuildContext context,
    Widget? title, // 标题
    Widget? content, // 内容
    Widget? confirm, // 确认按钮
    Widget? cancel, // 取消按钮
    Color? confirmBackgroundColor, // 确认按钮背景色
    Function()? onConfirm, // 确认按钮回调
    Function()? onCancel, // 取消按钮回调
  }) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: EdgeInsets.all(AppSpace.card),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 标题
                title != null
                    ? Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: title,
                      )
                    : Container(),
                // 内容
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: content ?? Text(LocaleKeys.commonBottomRemove.tr),
                ),
                SizedBox(height: AppSpace.listRow),

                // 取消 确认
                Row(
                  children: [
                    Expanded(
                      child: ButtonWidget.secondary(
                        LocaleKeys.commonBottomCancel.tr,
                        onTap: () {
                          Get.back(closeOverlays: true);
                          if (onCancel != null) onCancel();
                        },
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ButtonWidget.primary(
                        LocaleKeys.commonBottomConfirm.tr,
                        onTap: () {
                          Get.back(closeOverlays: true);
                          if (onConfirm != null) onConfirm();
                        },
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget getConfirmDialog({
    String title = "请确认操作", 
    String content = "", 
    String hint = "", 
    String confirmText = "确认",
    String cancelText = "取消",
    Function? onConfirm, 
    Function? onCancel,
    bool hasCancelBtn = true,
    bool needBtn = true,
    IconData icon = Icons.help_outline
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      icon: Icon(icon, size: 35.r, color: AppColors.color_primary1),
      
      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.color_666666
            ),
          ),
          SizedBox(height: 10.h),
          hint.isNotEmpty ? Text(
            hint,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.color_999999
            ),
          ) : const SizedBox(),
          SizedBox(height: 20.h),
          needBtn ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              hasCancelBtn ? Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F6),
                  elevation: 0, 
                  shadowColor: Colors.transparent, 
                  surfaceTintColor: Colors.transparent, 
                ),
                onPressed: () {
                  Get.back();
                  if (onCancel != null) {
                    onCancel();
                  }
                },
                child: Text(
                  cancelText, 
                  style: TextStyle(color: AppColors.color_333333)
                ),
              )) : const SizedBox(),
              SizedBox(width: hasCancelBtn ? 15.w : 0),
              Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.color_primary1,
                  elevation: 0, 
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent, 
                ),
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
                child: Text(confirmText),
              )),
            ],
          ) : const SizedBox()
        ],
      ),
    );
  }

  static Widget getCustomConfirmDialog({
    String title = "", 
    Widget? content, 
    Function? onConfirm, 
    Function? onCancel, 
    String confirmText = "确认",
    String cancelText = "取消",
    bool needBtn = true,
    IconData icon = Icons.help_outline}) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      icon: Icon(icon, size: 35.r, color: AppColors.color_primary1),
      contentPadding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 6.h),
          content ?? const SizedBox(),
          SizedBox(height: 20.h),

          needBtn ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F6),
                  elevation: 0, 
                  shadowColor: Colors.transparent, 
                  surfaceTintColor: Colors.transparent, 
                ),
                onPressed: () {
                  Get.back(closeOverlays: true);
                  if (onCancel != null) {
                    onCancel();
                  }
                },
                child: Text(
                  cancelText, 
                  style: TextStyle(color: AppColors.color_333333)
                ),
              )),
              SizedBox(width: 15.w),
              Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.color_primary1,
                  elevation: 0, 
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent, 
                ),
                onPressed: () {
                  Get.back(closeOverlays: true);
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
                child: Text(confirmText),
              )),
            ],
          ) : const SizedBox(),
        ],
      ),
    );
  }

  static Widget getPrivilegeDialog({
    String title = "", 
    String content = "", 
    String hint = "", 
    String confirmText = "先不用",
    String cancelText = "设置",
    Function? onConfirm, 
    Function? onCancel,
    bool hasCancelBtn = true,
    bool needBtn = true,
    String? icon,
  }) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      icon: icon != null ? Image.asset(icon, height: 90.h,) : null,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              color: AppColors.color_666666
            ),
          ),
          SizedBox(height: 6.h),
          hint.isNotEmpty ? Text(
            hint,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.color_999999
            ),
          ) : const SizedBox(),
          SizedBox(height: 20.h),
          needBtn ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              hasCancelBtn ? Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffF4F4F6),
                  elevation: 0, 
                  shadowColor: Colors.transparent, 
                  surfaceTintColor: Colors.transparent, 
                ),
                onPressed: () {
                  Get.back();
                  if (onCancel != null) {
                    onCancel();
                  }
                },
                child: Text(
                  cancelText, 
                  style: TextStyle(color: AppColors.color_333333)
                ),
              )) : const SizedBox(),
              SizedBox(width: hasCancelBtn ? 15.w : 0),
              Expanded(child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.color_primary1,
                  elevation: 0, 
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent, 
                ),
                onPressed: () {
                  if (onConfirm != null) {
                    onConfirm();
                  }
                },
                child: Text(confirmText),
              )),
            ],
          ) : const SizedBox()
        ],
      ),
    ); 
  }
}


