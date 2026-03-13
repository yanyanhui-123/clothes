import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';

class ImageManager {

  /// 获取Documents目录
  static Future<Directory> _baseDir() async {
    return await getApplicationDocumentsDirectory();
  }

  /// 获取完整路径
  static Future<File> getFile(String relativePath) async {
    final dir = await _baseDir();
    return File("${dir.path}/$relativePath");
  }

  /// 保存头像（固定文件）
  static Future<String> saveAvatar(XFile file) async {
    final dir = await _baseDir();

    final avatarDir = Directory("${dir.path}/avatar");

    if (!await avatarDir.exists()) {
      await avatarDir.create(recursive: true);
    }

    final path = "${avatarDir.path}/avatar.png";

    final newFile = File(path);

    await newFile.writeAsBytes(await file.readAsBytes());

    /// 返回相对路径
    return "avatar/avatar.png";
  }

  /// 保存衣服图片
  static Future<String> saveClothesImage(XFile file) async {
    final dir = await _baseDir();

    final clothesDir = Directory("${dir.path}/clothes");

    if (!await clothesDir.exists()) {
      await clothesDir.create(recursive: true);
    }

    final name = DateTime.now().millisecondsSinceEpoch;

    final path = "${clothesDir.path}/$name.png";

    await File(path).writeAsBytes(await file.readAsBytes());

    return "clothes/$name.png";
  }

  /// 删除图片
  static Future<void> deleteImage(String relativePath) async {
    final file = await getFile(relativePath);

    if (await file.exists()) {
      await file.delete();
    }
  }
}