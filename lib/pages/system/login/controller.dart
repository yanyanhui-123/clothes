import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:yyh_clothes/common/index.dart';

class LoginController extends GetxController {
  LoginController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  var readProtocol = false.obs;

  onLogin() {
    if(phoneController.text.isEmpty) {
      Loading.toast("请输入手机号");
    } else {
      Get.toNamed(RouteNames.systemMain);
    }
    
  }

  @override
  void onInit() {
    super.onInit();
    phoneController.text = "";
    Future.delayed(Duration.zero, () {
      firstInstall();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  void onSureBtnClick() {
    Get.toNamed(RouteNames.systemMain);
    if(phoneController.text.isNotEmpty) {
      EasyLoading.show(status: "登录中");
      UserLoginReq params = UserLoginReq(
        phone: phoneController.text
      );
      UserApi.login(params).then((UserTokenModel res) async {
        EasyLoading.dismiss();
        if(res.uid!.isNotEmpty){
          final context = Get.context;
          FocusScope.of(context!).unfocus();
          UserService.to.setToken(res.token ?? '').then((value) {
            UserService.to.getProfile();
            print("yyh-batteries ${UserService().profile.toJson()}");
          });
          
          UserService.to.uid = res.uid ?? '';
          Get.toNamed(RouteNames.systemMain);
          
        }
      }).catchError((err) {
        Loading.toast("$err");
        EasyLoading.dismiss();
      });
    } else {
      Loading.toast("请输入密码");
    }
    
  }

  Future firstInstall() async{
    await Get.dialog(
      ActionDialog.getCustomConfirmDialog(
        title: '用户隐私保护提示',
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "感谢您使用本应用，您使用本应用的服务之前请仔细阅读并同意",
                    style: TextStyle(color: AppColors.textColor515151)),
                TextSpan(
                    text: "《售用户隐私协议》",
                    style: TextStyle(color: AppColors.color_primary),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        // if (ConfigService.to.agreementBean == null) {
                        //   await ConfigService.to.getAgreement();
                        // }
                        // Get.toNamed(RouteNames.myWebPage, arguments: [
                        //   "用户隐私协议",
                        //   "${ConfigService.to.agreementBean?.userAgreementUrl}"
                        // ]);
                      }),
                TextSpan(
                    text:
                        "当你点击并开始使用应用时，即表示你已理解并同意该条款内容，该条款将对您产生法律约束力。如您拒绝，将无法使用应用。",
                    style: TextStyle(color: AppColors.textColor515151)),
              ]),
            ),
          ],
        ),
        cancelText: "拒绝",
        confirmText: "同意",
        onCancel: () {
          exit(0);
        },
        onConfirm: () async {
          // await Storage().setBool(Constants.firstInstall, true);
          Get.back();
        }
      )
    );
  }
}
