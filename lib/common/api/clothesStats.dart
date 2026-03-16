import 'package:isar/isar.dart';
import 'package:yyh_clothes/common/database/index.dart';

class ClothesStats {
  final int total;
  final List<MapEntry<int, int>> top3;

  ClothesStats({
    required this.total,
    required this.top3,
  });
}