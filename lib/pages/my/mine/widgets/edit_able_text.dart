import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:yyh_clothes/common/index.dart';

class EditableTextWidget extends StatelessWidget {
  final String text;
  final String title;
  final TextStyle? style;
  final bool isEditable;
  final ValueChanged<String> onChanged;

  const EditableTextWidget({
    super.key,
    required this.text,
    this.style,
    this.title = "",
    required this.onChanged,
    this.isEditable = false,
  });

  void _showEditDialog(String title) async {
    final controller = TextEditingController(text: text);
    await Get.dialog(
      ActionDialog.getCustomConfirmDialog(
        title: title,
        icon: Icons.info,
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(
            hintText: "请输入内容",
          ),
        ),
        onConfirm: () {
          final newText = controller.text.trim();
          if (newText.isNotEmpty) {
            onChanged(newText);
          }
          Get.back();
        }
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showEditDialog(title),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: style,
          ).marginOnly(right: 8.w),

          Visibility(
            visible: isEditable,
            child: Image.asset(AssetsImages.edit,  height: 12.h, color: AppColors.color_666666,)
          )
        ],
      ),
    );
  }
}