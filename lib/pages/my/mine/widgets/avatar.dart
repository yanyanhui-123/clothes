import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yyh_clothes/common/database/index.dart';
import 'package:yyh_clothes/common/index.dart';
import 'package:yyh_clothes/common/utils/image_manager.dart';

class AvatarWidget extends StatefulWidget {
  final String? initialAvatar;

  const AvatarWidget({
    super.key,
    this.initialAvatar,
  });

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  final ImagePicker _picker = ImagePicker();

  String? avatarPath;

  @override
  void initState() {
    super.initState();
    avatarPath = widget.initialAvatar;
    _initAvatar();
  }

  /// 初始化头像
  Future<void> _initAvatar() async {
    if (avatarPath != null) {
      final file = await ImageManager.getFile(avatarPath!);
      if (await file.exists()) {
        setState(() {
          avatarPath = file.path;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant AvatarWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialAvatar != oldWidget.initialAvatar) {
      setState(() {
        avatarPath = widget.initialAvatar;
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

    await _saveToIsar(relativePath);

    final realFile = await ImageManager.getFile(relativePath);

    setState(() {
      avatarPath = realFile.path;
    });
  }

  /// 保存图片到本地
  Future<String> _saveAvatar(XFile file) async {
    final dir = await getApplicationDocumentsDirectory();

    final avatarDir = Directory("${dir.path}/avatar");

    if (!await avatarDir.exists()) {
      await avatarDir.create(recursive: true);
    }

    final avatarPath = "${avatarDir.path}/avatar.png";

    final newFile = File(avatarPath);

    await newFile.writeAsBytes(await file.readAsBytes());

    /// 返回相对路径（避免iOS沙盒路径变化）
    return "avatar/avatar.png";
  }

  /// 写入 Isar
  Future<void> _saveToIsar(String path) async {
    final isar = await IsarService().db;

    final user = await isar.users.where().findFirst();

    if (user != null) {
      await isar.writeTxn(() async {
        user.avatar = path;
        await isar.users.put(user);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget avatar;
    ImageProvider imageProvider;

    if (avatarPath != null && File(avatarPath!).existsSync()) {
      imageProvider = FileImage(File(avatarPath!));
    } else {
      imageProvider = const AssetImage(AssetsImages.defaultAvatar);
    }

    avatar = CircleAvatar(
      radius: 60,
      backgroundColor: Colors.transparent,
      backgroundImage: imageProvider,
    );

    return GestureDetector(
      onTap: _showSelect,
      child: Stack(
        alignment: Alignment.center,
        children: [
          /// 外层徽章背景（预留）
          // Container(
          //   width: 90,
          //   height: 90,
          //   decoration: BoxDecoration(
          //     shape: BoxShape.circle,
          //     border: Border.all(
          //       color: Colors.orange,
          //       width: 3,
          //     ),
          //   ),
          // ),

          avatar,
        ],
      ),
    );
  }
}