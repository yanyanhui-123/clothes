import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yyh_clothes/common/database/index.dart';
import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/common/utils/image_manager.dart';

class UploadClothesWidget extends StatefulWidget {
  final String? initialPath;
  final Function onChange;

  const UploadClothesWidget({
    super.key,
    this.initialPath,
    required this.onChange
  });

  @override
  State<UploadClothesWidget> createState() => _UploadClothesWidgetState();
}

class _UploadClothesWidgetState extends State<UploadClothesWidget> {
  final ImagePicker _picker = ImagePicker();

  String? clothesPath;

  @override
  void initState() {
    super.initState();
    clothesPath = widget.initialPath;
    _initAvatar();
  }

  /// 初始化头像
  Future<void> _initAvatar() async {
    if (clothesPath != null) {
      final file = await ImageManager.getFile(clothesPath!);
      if (await file.exists()) {
        setState(() {
          clothesPath = file.path;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant UploadClothesWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialPath != oldWidget.initialPath) {
      setState(() {
        clothesPath = widget.initialPath;
        _initAvatar();
      });
    }
  }

  /// 点击头像
  void _showSelect() {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: const Text("拍照"),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.camera);
                },
              ),
              ListTile(
                title: const Text("从相册选择"),
                onTap: () {
                  Navigator.pop(context);
                  _pick(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  /// 选择图片
  Future<void> _pick(ImageSource source) async {
    final XFile? file = await _picker.pickImage(source: source);

    if (file == null) return;

    final relativePath = await _saveAvatar(file);
    
    widget.onChange(relativePath);

    final realFile = await ImageManager.getFile(relativePath);

    setState(() {
      clothesPath = realFile.path;
    });
  }

  /// 保存图片到本地
  Future<String> _saveAvatar(XFile file) async {
    final dir = await getApplicationDocumentsDirectory();

    final avatarDir = Directory("${dir.path}/clothes");

    if (!await avatarDir.exists()) {
      await avatarDir.create(recursive: true);
    }

    final now = DateTime.now().millisecondsSinceEpoch;

    final clothesPath = "${avatarDir.path}/$now.png";

    final newFile = File(clothesPath);

    await newFile.writeAsBytes(await file.readAsBytes());

    /// 返回相对路径（避免iOS沙盒路径变化）
    return "clothes/$now.png"; 
  }

  double size = 200.h;
  double width = double.infinity;

  @override
  Widget build(BuildContext context) {
    Widget image;

    if (clothesPath != null && File(clothesPath!).existsSync()) {
      image = Image.file(
        File(clothesPath!), 
        height: size, 
        width: width,
        fit: BoxFit.cover
      );
    } else {
      image = Image.asset(
        AssetsImages.create, 
        color: AppColors.gary224224224,
        height: size, 
        width: width
      );
    }


    return GestureDetector(
      onTap: _showSelect,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12.r)),
        child: Container(
          height: size, 
          width: width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.r)),
          ),
          child: image,
        ),
      ),
    );
  }
}