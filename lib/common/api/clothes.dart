import 'package:yyh_clothes/common/api/clothesStats.dart';
import 'package:yyh_clothes/common/database/index.dart';
import 'package:isar/isar.dart';
class ClothesApi {
  // 统计全部服装数量
  Future<int> getTotalClothesCount() async {
    final isar = await IsarService().db;
    return await isar.clothes.count();
  }

  // 统计每个分类数量
  Future<Map<int, int>> getCategoryCounts() async {
    final isar = await IsarService().db;

    final clothes = await isar.clothes.where().findAll();

    final Map<int, int> result = {};

    for (var item in clothes) {
      result[item.categoryId] = (result[item.categoryId] ?? 0) + 1;
    }

    return result;
  }

  // 获取数量最多的前三个分类
  Future<List<MapEntry<int, int>>> getTop3Categories() async {
    final isar = await IsarService().db;

    final clothes = await isar.clothes.where().findAll();

    final Map<int, int> map = {};

    for (var item in clothes) {
      map[item.categoryId] = (map[item.categoryId] ?? 0) + 1;
    }

    final list = map.entries.toList();

    list.sort((a, b) => b.value.compareTo(a.value));

    return list.take(3).toList();
  }

  Future<ClothesStats> getClothesStats() async {
    final isar = await IsarService().db;

    final clothes = await isar.clothes.where().findAll();

    final Map<int, int> map = {};

    for (var item in clothes) {
      map[item.categoryId] = (map[item.categoryId] ?? 0) + 1;
    }

    final list = map.entries.toList();

    list.sort((a, b) => b.value.compareTo(a.value));

    return ClothesStats(
      total: clothes.length,
      top3: list.take(2).toList(),
    );
  }
}


