import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:yyh_clothes/common/index.dart';

class EditableTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final bool isEditable;
  final ValueChanged<String> onChanged;

  const EditableTextWidget({
    super.key,
    required this.text,
    this.style,
    required this.onChanged,
    this.isEditable = false,
  });

  void _showEditDialog(BuildContext context) {
    final controller = TextEditingController(text: text);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("编辑内容"),
          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: "请输入内容",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("取消"),
            ),
            ElevatedButton(
              onPressed: () {
                final newText = controller.text.trim();

                if (newText.isNotEmpty) {
                  onChanged(newText);
                }

                Navigator.pop(context);
              },
              child: const Text("保存"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showEditDialog(context),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: style,
          ).marginOnly(right: 8.w),

          Visibility(
            visible: isEditable,
            child: GestureDetector(
              onTap: () => _showEditDialog(context),
              child: Image.asset(AssetsImages.edit,  height: 12.h, color: AppColors.color_666666,),
            )
          )
        ],
      ),
    );
  }
}