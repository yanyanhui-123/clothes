import 'package:isar/isar.dart';

part 'user.g.dart';

@collection
class User {

  Id id = Isar.autoIncrement;

  String? name;

  String? avatar;

  String? desc;

  DateTime createTime = DateTime.now();
}
