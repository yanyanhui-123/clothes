// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit_item.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOutfitItemCollection on Isar {
  IsarCollection<OutfitItem> get outfitItems => this.collection();
}

const OutfitItemSchema = CollectionSchema(
  name: r'OutfitItem',
  id: 8327490524220254728,
  properties: {
    r'clothesId': PropertySchema(
      id: 0,
      name: r'clothesId',
      type: IsarType.long,
    ),
    r'outfitId': PropertySchema(
      id: 1,
      name: r'outfitId',
      type: IsarType.long,
    ),
    r'sort': PropertySchema(
      id: 2,
      name: r'sort',
      type: IsarType.long,
    )
  },
  estimateSize: _outfitItemEstimateSize,
  serialize: _outfitItemSerialize,
  deserialize: _outfitItemDeserialize,
  deserializeProp: _outfitItemDeserializeProp,
  idName: r'id',
  indexes: {
    r'outfitId': IndexSchema(
      id: 2088527764185479769,
      name: r'outfitId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'outfitId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'clothesId': IndexSchema(
      id: -3864373649599209738,
      name: r'clothesId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'clothesId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _outfitItemGetId,
  getLinks: _outfitItemGetLinks,
  attach: _outfitItemAttach,
  version: '3.1.0+1',
);

int _outfitItemEstimateSize(
  OutfitItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _outfitItemSerialize(
  OutfitItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.clothesId);
  writer.writeLong(offsets[1], object.outfitId);
  writer.writeLong(offsets[2], object.sort);
}

OutfitItem _outfitItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OutfitItem();
  object.clothesId = reader.readLong(offsets[0]);
  object.id = id;
  object.outfitId = reader.readLong(offsets[1]);
  object.sort = reader.readLong(offsets[2]);
  return object;
}

P _outfitItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _outfitItemGetId(OutfitItem object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _outfitItemGetLinks(OutfitItem object) {
  return [];
}

void _outfitItemAttach(IsarCollection<dynamic> col, Id id, OutfitItem object) {
  object.id = id;
}

extension OutfitItemQueryWhereSort
    on QueryBuilder<OutfitItem, OutfitItem, QWhere> {
  QueryBuilder<OutfitItem, OutfitItem, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhere> anyOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'outfitId'),
      );
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhere> anyClothesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'clothesId'),
      );
    });
  }
}

extension OutfitItemQueryWhere
    on QueryBuilder<OutfitItem, OutfitItem, QWhereClause> {
  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> outfitIdEqualTo(
      int outfitId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'outfitId',
        value: [outfitId],
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> outfitIdNotEqualTo(
      int outfitId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [],
              upper: [outfitId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [outfitId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [outfitId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'outfitId',
              lower: [],
              upper: [outfitId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> outfitIdGreaterThan(
    int outfitId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'outfitId',
        lower: [outfitId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> outfitIdLessThan(
    int outfitId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'outfitId',
        lower: [],
        upper: [outfitId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> outfitIdBetween(
    int lowerOutfitId,
    int upperOutfitId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'outfitId',
        lower: [lowerOutfitId],
        includeLower: includeLower,
        upper: [upperOutfitId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> clothesIdEqualTo(
      int clothesId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'clothesId',
        value: [clothesId],
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> clothesIdNotEqualTo(
      int clothesId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clothesId',
              lower: [],
              upper: [clothesId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clothesId',
              lower: [clothesId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clothesId',
              lower: [clothesId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'clothesId',
              lower: [],
              upper: [clothesId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> clothesIdGreaterThan(
    int clothesId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clothesId',
        lower: [clothesId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> clothesIdLessThan(
    int clothesId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clothesId',
        lower: [],
        upper: [clothesId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterWhereClause> clothesIdBetween(
    int lowerClothesId,
    int upperClothesId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'clothesId',
        lower: [lowerClothesId],
        includeLower: includeLower,
        upper: [upperClothesId],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OutfitItemQueryFilter
    on QueryBuilder<OutfitItem, OutfitItem, QFilterCondition> {
  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> clothesIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'clothesId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition>
      clothesIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'clothesId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> clothesIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'clothesId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> clothesIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'clothesId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> outfitIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'outfitId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition>
      outfitIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'outfitId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> outfitIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'outfitId',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> outfitIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'outfitId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> sortEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> sortGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> sortLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sort',
        value: value,
      ));
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterFilterCondition> sortBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sort',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension OutfitItemQueryObject
    on QueryBuilder<OutfitItem, OutfitItem, QFilterCondition> {}

extension OutfitItemQueryLinks
    on QueryBuilder<OutfitItem, OutfitItem, QFilterCondition> {}

extension OutfitItemQuerySortBy
    on QueryBuilder<OutfitItem, OutfitItem, QSortBy> {
  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> sortByClothesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothesId', Sort.asc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> sortByClothesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothesId', Sort.desc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> sortByOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> sortByOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> sortBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> sortBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }
}

extension OutfitItemQuerySortThenBy
    on QueryBuilder<OutfitItem, OutfitItem, QSortThenBy> {
  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenByClothesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothesId', Sort.asc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenByClothesIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'clothesId', Sort.desc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenByOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.asc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenByOutfitIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'outfitId', Sort.desc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.asc);
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QAfterSortBy> thenBySortDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sort', Sort.desc);
    });
  }
}

extension OutfitItemQueryWhereDistinct
    on QueryBuilder<OutfitItem, OutfitItem, QDistinct> {
  QueryBuilder<OutfitItem, OutfitItem, QDistinct> distinctByClothesId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'clothesId');
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QDistinct> distinctByOutfitId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'outfitId');
    });
  }

  QueryBuilder<OutfitItem, OutfitItem, QDistinct> distinctBySort() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sort');
    });
  }
}

extension OutfitItemQueryProperty
    on QueryBuilder<OutfitItem, OutfitItem, QQueryProperty> {
  QueryBuilder<OutfitItem, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OutfitItem, int, QQueryOperations> clothesIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'clothesId');
    });
  }

  QueryBuilder<OutfitItem, int, QQueryOperations> outfitIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'outfitId');
    });
  }

  QueryBuilder<OutfitItem, int, QQueryOperations> sortProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sort');
    });
  }
}
