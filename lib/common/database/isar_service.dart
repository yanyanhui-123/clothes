import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yyh_clothes/common/database/models/category.dart';
import 'package:yyh_clothes/common/database/models/clothes.dart';
import 'package:yyh_clothes/common/database/models/outfit.dart';
import 'package:yyh_clothes/common/database/models/outfit_item.dart';
import 'package:yyh_clothes/common/database/models/user.dart';


class IsarService {
  static final IsarService _instance = IsarService._internal();

  factory IsarService() => _instance;

  IsarService._internal();

  static Isar? _isar;

  Future<Isar> get db async {
    if (_isar != null) {
      return _isar!;
    }

    final dir = await getApplicationDocumentsDirectory();

    _isar = await Isar.open(
      [
        UserSchema,
        CategorySchema,
        ClothesSchema,
        OutfitSchema,
        OutfitItemSchema,
      ],
      directory: dir.path,
    );

    return _isar!;
  }
}