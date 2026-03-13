import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/common/widgets/image.dart';

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final String icon;
  final String iconSelected;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    required this.iconSelected,
    this.count = 0,
  });
}

/// 导航栏
class BuildNavigation extends StatelessWidget {
  final int currentIndex;
  final List<NavigationItemModel> items;
  final Function(int) onTap;

  const BuildNavigation({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var ws = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      var color = (i == currentIndex)
          ? AppColors.blueColor0161233
          : AppColors.textColor515151;
      var item = items[i];
      ws.add(
        <Widget>[
          // 图标
          ImageWidget.asset(
            i == currentIndex ? item.iconSelected : item.icon,
            width: 23.w,
            height: 23.w,
            fit: BoxFit.fill,
          ).paddingBottom(2.5.w),
          // 文字
          TextWidget(
            text: item.label.tr,
            color: color,
            size: 11.sp,
            weight: FontWeight.bold,
          ),
        ]
            .toColumn(
              mainAxisAlignment: MainAxisAlignment.center, // 居中
              mainAxisSize: MainAxisSize.max, // 最大
            )
            .onTap(() => onTap(i))
            .expanded(),
      );
    }
    return BottomAppBar(
      color: AppColors.surface,
      elevation: 0,
      child: ws
          .toRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          )
          .height(kBottomNavigationBarHeight.w),
    );
  }
}
