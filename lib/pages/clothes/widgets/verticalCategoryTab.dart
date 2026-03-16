import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yyh_clothes/common/index.dart';

class CategoryTabItem {
  final String title;
  final bool isHeader;

  CategoryTabItem({
    required this.title,
    this.isHeader = false,
  });
}

class VerticalCategoryTab extends StatefulWidget {
  final List<String> items;
  final ValueChanged<int>? onChanged;
  final int initialIndex;

  const VerticalCategoryTab({
    super.key,
    required this.items,
    this.onChanged,
    this.initialIndex = 0,
  });

  @override
  State<VerticalCategoryTab> createState() => _VerticalCategoryTabState();
}

class _VerticalCategoryTabState extends State<VerticalCategoryTab> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      color: Colors.white,
      child: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return _buildItem(index);
        },
      ),
    );
  }

  Widget _buildItem(int index) {
    bool selected = index == currentIndex;

    bool isPrev = index == currentIndex - 1;
    bool isNext = index == currentIndex + 1;

    BorderRadius radius = BorderRadius.zero;

    /// 上一项 -> 右下角圆角
    if (isPrev) {
      radius = const BorderRadius.only(
        bottomRight: Radius.circular(16),
      );
    }

    /// 下一项 -> 右上角圆角
    if (isNext) {
      radius = const BorderRadius.only(
        topRight: Radius.circular(16),
      );
    }

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });

        widget.onChanged?.call(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.linear,
        height: 48.h,
        decoration: BoxDecoration(
          color: selected ? Colors.white : const Color(0xfff5f5f5),
          borderRadius: radius,
        ),
        child: Row(
          children: [
            /// 左侧选中指示条
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              curve: Curves.linear,
              width: 3.w,
              height: 23.sp,
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color: selected ? AppColors.color_primary1 : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            Expanded(
              child: Text(
                widget.items[index],
                style: TextStyle(
                  fontSize: 14.sp,
                  color: selected ? AppColors.color_primary1 : Colors.black87,
                  fontWeight:
                      selected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}