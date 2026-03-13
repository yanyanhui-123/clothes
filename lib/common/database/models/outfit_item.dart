import 'package:isar/isar.dart';

part 'outfit_item.g.dart';

@collection
class OutfitItem {

  Id id = Isar.autoIncrement;

  @Index()
  late int outfitId;

  @Index()
  late int clothesId;

  int sort = 0;
}