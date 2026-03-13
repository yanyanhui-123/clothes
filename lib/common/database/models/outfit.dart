import 'package:isar/isar.dart';

part 'outfit.g.dart';



@collection
class Outfit {

  Id id = Isar.autoIncrement;

  late String name;

  String? cover;

  /// 穿搭说明
  String? note;

  /// 场景
  String? scene;
  /*
  上班
  约会
  旅行
  日常
  */

  DateTime createTime = DateTime.now();
}