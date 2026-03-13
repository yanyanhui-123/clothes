import 'package:flutter/material.dart';
import 'package:yyh_clothes/common/index.dart';

class FloatingNavBar extends StatelessWidget {
  final List<NavItem> items;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const FloatingNavBar({
    super.key,
    required this.items,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
            height: 64,
            padding: const EdgeInsets.symmetric(horizontal: 18),
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(32),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                final selected = index == currentIndex;
                return GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(index),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      width: 50,
                      height: 42,
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.color_primary1 // 高亮色
                            : Colors.transparent,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        items[index].icon,
                        height: 23,
                        cacheHeight: 23,
                        color: selected
                            ? Colors.white
                            : Colors.grey.shade500,
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
      ),
    );
  }
}


class NavItem {
  final String icon;

  const NavItem({required this.icon});
}
