import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yyh_clothes/common/index.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  const PrimaryButton({this.title = "", super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.w,
      decoration: BoxDecoration(
          color: AppColors.blueColor0161233,
          borderRadius: BorderRadius.circular(10.w)),
      alignment: Alignment.center,
      child: TextWidget(
        text: title,
        size: 17.sp,
        color: Colors.white,
        weight: FontWeight.w500,
      ),
    );
  }
}
