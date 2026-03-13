import 'package:dismiss_keyboard_on_tap/dismiss_keyboard_on_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'global.dart';
import 'package:yyh_clothes/common/index.dart';

Future<void> main() async {
  await Global.init();
  WidgetsFlutterBinding.ensureInitialized();

  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 667), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
        builder: (context, widget) {
          return DismissKeyboardOnTap(
            child: GetMaterialApp(
              title: 'yyh_clothes',
              // 样式
              // theme:
              //     ConfigService.to.isDarkModel ? AppTheme.dark : AppTheme.light,
              theme: AppTheme.light,
              // 路由
              initialRoute: RouteNames.systemSplash,
              getPages: RoutePages.list,
              navigatorObservers: [RoutePages.observer],
              // 多语言
              translations: Translation(), // 词典
              localizationsDelegates: Translation.localizationsDelegates, // 代理
              supportedLocales: Translation.supportedLocales, // 支持的语言种类
              locale: ConfigService.to.locale, // 当前语言种类
              fallbackLocale: Translation.fallbackLocale, // 默认语言种类
              //页面转场
              defaultTransition: Transition.cupertino,
              // builder
              builder: (context, widget) {
                widget = EasyLoading.init()(context, widget); // EasyLoading 初始化
                // 不随系统字体缩放比例
                return MediaQuery(
                  data: MediaQuery.of(context)
                      .copyWith(textScaler: const TextScaler.linear(1.0)),
                  child: widget,
                );
              },
              debugShowCheckedModeBanner: false,
            ),
          );
        });
  }
}
