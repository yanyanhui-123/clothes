
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/extension/ex_widget.dart';
import 'package:yyh_clothes/common/index.dart';

Widget showCustomDialog({String? title, Widget? content, Function? onConfirm, Function? onCancel}){
  return AlertDialog(
    shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.r))
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
    content: SizedBox(
      height: 200.h,
      width: 0.8.sw,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ).marginOnly(top: 20.h),

          content ?? const SizedBox(),

          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        width: 1,
                        color: Color(0xffF4F4F4)
                      )
                    )
                  ),
                  child: TextButton(
                    onPressed: ()  {
                      Get.back();
                      if (onCancel != null) onCancel();
                    },
                    child: Text(
                      LocaleKeys.commonBottomCancel.tr, 
                      style: TextStyle(color: Colors.black, fontSize: 17.sp)),
                  ),
                )
              ),
              Expanded(
                child: TextButton(
                  child: Text(
                    LocaleKeys.commonBottomConfirm.tr,
                    style: TextStyle(fontSize: 17.sp),
                  ),
                  onPressed: () {
                    if (onConfirm != null) onConfirm();
                  },
                )
              ),
            ],
          ).border(top: 1, color: const Color(0xffF4F4F4))
        ],
      ),
    ),
  );
}

Widget customInput(TextEditingController controller, {String? hintText}) {
  return TextField(
    controller: controller,
    decoration:  InputDecoration(
      filled: true,
      fillColor: const Color(0xffF4F4F4),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none
      ),
      hintText: hintText ?? ''
    ),
  );
} 

void showCustomBottomSheet({Function? onConfirm, content}) {
  Get.bottomSheet(
      backgroundColor: Colors.white,
      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r), 
          topRight:  Radius.circular(15.r)
        )
      ),
      Column(
        children: [
          Row(
            children: [
              TextButton(
                onPressed: (){
                  Get.back();
                }, 
                child: const Text(
                  "取消", 
                  style: TextStyle(color: Colors.black)
                )
              ),
              const Spacer(),
              TextButton(
                onPressed: (){
                  if(onConfirm != null) {
                    onConfirm();
                  }
                }, 
                child: const Text("确定")
              ),
            ],
          ),
          Expanded(
            child: content ?? const SizedBox(),
          )
        ],
      )
      
    );
}