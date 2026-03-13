import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/common/values/images.dart';

import '../routers/names.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(this.errorDetails, {super.key});
  final FlutterErrorDetails errorDetails;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsImages.appError, height: 150.h),
          const SizedBox(height: 16),
          const Text(
            '系统开了个小差',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            '当前页面暂时无法正常打开，',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.color_666666,
            ),
          ),
          Text(
            '可能是网络波动或系统正在处理中',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.color_666666,
            ),
          ),
          SizedBox(height: 30.h),
          ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color_primary
              ),
              child: Text(
                '返回上一页',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.sp,
                ),
              )).width(0.8.sw).height(46.h),
          SizedBox(height: 30.h),
          SizedBox(
            width: 0.8.sw,
            child: SingleChildScrollView(
              child: Text(
              'exception:${errorDetails.exceptionAsString()}\n stack:${errorDetails.stack}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: AppColors.color_666666,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressed() {
    Get.offAllNamed(RouteNames.systemSplash);
  }
}
