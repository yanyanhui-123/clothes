import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'index.dart';
import 'package:yyh_clothes/common/index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  Widget _buildView() {
    return Stack(
      children: [
        Container(
          width: ScreenUtil().setWidth(750),
          height: ScreenUtil().setHeight(1334),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AssetsImages.login_bg,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SELF", 
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1
                      )
                    ),
                    Text(
                      "SHERO", 
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        height: 1
                      )
                    ),
                    SizedBox(height: 10.h),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: " 柔柔",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              height: 1
                            )
                          ),
                          TextSpan(
                            text: " | ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              height: 1
                            )
                          ),
                          TextSpan(
                            text: "做 自 己 的 英 雄",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                              height: 1
                            )
                          ),
                        ]
                      )
                    )
                  ],
                ),

                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      loginInputItem(
                        controller.phoneController,
                        hintText: "请输入手机号码"
                      ),
                      SizedBox(height: 15.h),
                      loginInputItem(
                        controller.pwdController,
                        hintText: "请输入验证码",
                        suffixIcon: TextButton(
                          child: Text(
                            "获取验证码",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.color_333333,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          onPressed: () {},
                        ).marginOnly(right: 10.w)
                      ),
                      SizedBox(height: 30.h),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.r),
                          color: Colors.black
                        ),
                        child: IconButton(
                          onPressed: () {
                            controller.onLogin();
                          }, 
                          icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,)
                        ),
                      )
                    ],
                  ),
                ),

                _buildPrivacyBtn()
              ],
            ).paddingSymmetric(horizontal: 30.w, vertical: 20.h),
          )
        )
      ],
    );
  }

  Widget loginInputItem(TextEditingController inputController, {String? hintText, Widget? suffixIcon, bool obscureText = false}) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 87, 84, 84).withOpacity(0.18),
            blurRadius: 12,        // 关键：小
            spreadRadius: 0,      // 不扩散
            blurStyle: BlurStyle.outer
          ),
        ],
      ),
      child: TextField(
        controller: inputController,
        obscureText: obscureText,
        style: TextStyle(
          fontSize: 14.sp,
          color: AppColors.color_333333,
          fontWeight: FontWeight.w500
        ),
        decoration: InputDecoration(
          
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: AppColors.color_999999,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40.r),
            borderSide: BorderSide.none
          ),
          suffixIcon: suffixIcon
        )
      ),
    );
  }

  // 隐私协议选择框和链接
  Widget _buildPrivacyBtn() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => CheckBoxWidget.radio(
          controller.readProtocol.value,
          (val) {
            controller.readProtocol.value = val;
          },
          icon: const Icon(
            Icons.square_outlined, 
            color: Color.fromARGB(20, 0, 0, 0),),
          iconChecked: Icon(
            Icons.check_box, 
            color: AppColors.color_primary),
        ).constrained(width: 30.w)),

        Text(
          "我已同意并阅读",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.color_333333,
            fontWeight: FontWeight.bold,
          )
        ),
        Text(
          "《用户协议》",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.color_primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "和",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.color_333333,
            fontWeight: FontWeight.bold,
          )
        ),
        Text(
          "《隐私协议》",
          style: TextStyle(
            fontSize: 12.sp,
            color: AppColors.color_primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: _buildView(),
        );
      },
    );
  }
}
