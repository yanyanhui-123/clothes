import 'package:yyh_clothes/common/database/index.dart';
import 'package:isar/isar.dart';
class CategorysApi {
  // 获取分类列表
  Future<List<Category>> getCateList() async {
    final isar = await IsarService().db;

    return await isar.categorys.where().sortBySort().findAll();
  }

  // 新增分类
  Future<bool> addCate(String name, int sort) async {
    final isar = await IsarService().db;
    final category = Category()
      ..name = name
      ..sort = sort;

    await isar.writeTxn(() async {
      await isar.categorys.put(category);
    });

    return true;
  }

  Future<bool> editCate(String name, Category item) async {
    final isar = await IsarService().db;

    await isar.writeTxn(() async {
      item.name = name;
      await isar.categorys.put(item);
    });

    return true;
  }

  Future<bool> deleteCate(Category item) async {
    final isar = await IsarService().db;

    await isar.writeTxn(() async {
      await isar.categorys.delete(item.id);
    });

    return true;
  }

  Future<bool> reSortCate(List<Category> list) async {
    final isar = await IsarService().db;

    await isar.writeTxn(() async {

      for (int i = 0; i < list.length; i++) {
        list[i].sort = i;
        await isar.categorys.put(list[i]);
      }

    });

    return true;
  }
}


