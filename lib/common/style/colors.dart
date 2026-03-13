import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/index.dart';

/// 应用颜色
class AppColors {
  /// *******************************************
  /// 自定义 颜色
  /// *******************************************

  /// 产品
  static ExtFlutterDefaultColorTheme get flutterDefault =>
      Get.theme.extension<ExtFlutterDefaultColorTheme>()!;
  static Color get highlight =>
      Get.theme.extension<ExtFlutterDefaultColorTheme>()!.highlight!;

  /// 基础色
  static ExtBaseColorTheme get base =>
      Get.theme.extension<ExtBaseColorTheme>()!;
  static Color get info => Get.theme.extension<ExtBaseColorTheme>()!.info!;
  static Color get success =>
      Get.theme.extension<ExtBaseColorTheme>()!.success!;
  static Color get warning =>
      Get.theme.extension<ExtBaseColorTheme>()!.warning!;
  static Color get danger => Get.theme.extension<ExtBaseColorTheme>()!.danger!;

  /// *******************************************
  /// Material System
  /// *******************************************

  static Color get background => Get.theme.colorScheme.background;

  static Brightness get brightness => Get.theme.colorScheme.brightness;

  static Color get error => Get.theme.colorScheme.error;

  static Color get errorContainer => Get.theme.colorScheme.errorContainer;

  static Color get inversePrimary => Get.theme.colorScheme.inversePrimary;

  static Color get inverseSurface => Get.theme.colorScheme.inverseSurface;

  static Color get onBackground => Get.theme.colorScheme.onBackground;

  static Color get onError => Get.theme.colorScheme.onError;

  static Color get onErrorContainer => Get.theme.colorScheme.onErrorContainer;

  static Color get onInverseSurface => Get.theme.colorScheme.onInverseSurface;

  static Color get onPrimary => Get.theme.colorScheme.onPrimary;

  static Color get onPrimaryContainer =>
      Get.theme.colorScheme.onPrimaryContainer;

  static Color get onSecondary => Get.theme.colorScheme.onSecondary;

  static Color get onSecondaryContainer =>
      Get.theme.colorScheme.onSecondaryContainer;

  static Color get onSurface => Get.theme.colorScheme.onSurface;

  static Color get onSurfaceVariant => Get.theme.colorScheme.onSurfaceVariant;

  static Color get onTertiary => Get.theme.colorScheme.onTertiary;

  static Color get onTertiaryContainer =>
      Get.theme.colorScheme.onTertiaryContainer;

  static Color get outline => Get.theme.colorScheme.outline;

  static Color get primary => Get.theme.colorScheme.primary;

  static Color get primaryContainer => Get.theme.colorScheme.primaryContainer;

  static Color get secondary => Get.theme.colorScheme.secondary;

  static Color get secondaryContainer =>
      Get.theme.colorScheme.secondaryContainer;

  static Color get shadow => Get.theme.colorScheme.shadow;

  static Color get surface => Get.theme.colorScheme.surface;

  static Color get surfaceVariant => Get.theme.colorScheme.surfaceVariant;

  static Color get tertiary => Get.theme.colorScheme.tertiary;

  static Color get tertiaryContainer => Get.theme.colorScheme.tertiaryContainer;

  static Color gary246246246 = const Color.fromRGBO(246, 246, 246, 1);

  static Color gary204204204 = const Color.fromRGBO(204, 204, 204, 1);

  static Color gary224224224 = const Color.fromRGBO(224, 224, 224, 1);

  static Color textColor171717 = const Color.fromRGBO(17, 17, 17, 1);

  static Color textColor343434 = const Color.fromRGBO(34, 34, 34, 1);

  static Color textColor515151 = const Color.fromRGBO(51, 51, 51, 1);

  static Color textColor102102102 = const Color.fromRGBO(102, 102, 102, 1);

  static Color textColor254153781 = const Color.fromRGBO(254, 153, 78, 1);

  static Color textColor237237237 = const Color.fromRGBO(237, 237, 237, 1);

  static Color blueColor0161233 = const Color.fromARGB(255, 1, 172, 251);

  static Color bgColor244244244 = const Color.fromRGBO(244, 244, 244, 1);

  static Color redColor25410396 = const Color.fromRGBO(254, 103, 96, 1);
  static Color color_333333 = const Color(0xff333333);
  static Color color_999999 = const Color(0xff999999);
  static Color color_666666 = const Color(0xff666666);
  static Color color_primary = const Color.fromARGB(255, 130, 150, 241);
  static Color color_primary1 = const Color.fromARGB(255, 110, 135, 246);
}
