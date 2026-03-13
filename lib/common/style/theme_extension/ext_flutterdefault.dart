import 'package:flutter/material.dart';

/// 产品色
@immutable
class ExtFlutterDefaultColorTheme extends ThemeExtension<ExtFlutterDefaultColorTheme> {
  static const light = ExtFlutterDefaultColorTheme(highlight: Color(0xFFF77866));
  static const dark = ExtFlutterDefaultColorTheme(highlight: Color(0xFFFFB4A9));

  /// 强调色
  final Color? highlight;

  const ExtFlutterDefaultColorTheme({
    required this.highlight,
  });

  @override
  ThemeExtension<ExtFlutterDefaultColorTheme> copyWith({
    Color? highlight,
  }) {
    return ExtFlutterDefaultColorTheme(
      highlight: highlight ?? this.highlight,
    );
  }

  @override
  ThemeExtension<ExtFlutterDefaultColorTheme> lerp(
      ThemeExtension<ExtFlutterDefaultColorTheme>? other, double t) {
    if (other is! ExtFlutterDefaultColorTheme) {
      return this;
    }
    return ExtFlutterDefaultColorTheme(
      highlight: Color.lerp(highlight, other.highlight, t),
    );
  }

  @override
  String toString() {
    return 'ExtWooColorTheme('
        'highlight: $highlight,'
        ')';
  }
}
