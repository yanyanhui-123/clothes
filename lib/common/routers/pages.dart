import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'index.dart';
import 'package:yyh_clothes/pages/index.dart';

class RoutePages {
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

// 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.myLanguage,
      page: () => const HomePage(),
    ),
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.systemMain,
      page: () => const MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: RouteNames.systemUserAgreement,
      page: () => const UserAgreementPage(),
    ),
    
  ];
}
