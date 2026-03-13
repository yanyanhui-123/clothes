import 'package:isar/isar.dart';

part 'clothes.g.dart';


@collection
class Clothes {

  Id id = Isar.autoIncrement;

  /// 分类ID
  @Index()
  late int categoryId;

  /// 衣服名称
  late String name;

  /// 图片
  String? image;

  /// 品牌
  String? brand;

  /// 颜色
  String? color;

  /// 季节
  int season = 0;
  /*
  0 全年
  1 春
  2 夏
  3 秋
  4 冬
  */

  /// 是否收藏
  bool favorite = false;

  /// 购买价格
  double? price;

  /// 购买时间
  DateTime? buyTime;

  DateTime createTime = DateTime.now();
}
