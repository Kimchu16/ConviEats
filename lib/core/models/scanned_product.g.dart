// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scanned_product.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScannedProductCollection on Isar {
  IsarCollection<ScannedProduct> get scannedProducts => this.collection();
}

const ScannedProductSchema = CollectionSchema(
  name: r'ScannedProduct',
  id: 1356376496776628612,
  properties: {
    r'product': PropertySchema(
      id: 0,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    ),
    r'scannedAt': PropertySchema(
      id: 1,
      name: r'scannedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _scannedProductEstimateSize,
  serialize: _scannedProductSerialize,
  deserialize: _scannedProductDeserialize,
  deserializeProp: _scannedProductDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Product': ProductSchema},
  getId: _scannedProductGetId,
  getLinks: _scannedProductGetLinks,
  attach: _scannedProductAttach,
  version: '3.1.0+1',
);

int _scannedProductEstimateSize(
  ScannedProduct object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      ProductSchema.estimateSize(
          object.product, allOffsets[Product]!, allOffsets);
  return bytesCount;
}

void _scannedProductSerialize(
  ScannedProduct object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Product>(
    offsets[0],
    allOffsets,
    ProductSchema.serialize,
    object.product,
  );
  writer.writeDateTime(offsets[1], object.scannedAt);
}

ScannedProduct _scannedProductDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScannedProduct();
  object.id = id;
  object.product = reader.readObjectOrNull<Product>(
        offsets[0],
        ProductSchema.deserialize,
        allOffsets,
      ) ??
      Product();
  object.scannedAt = reader.readDateTime(offsets[1]);
  return object;
}

P _scannedProductDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Product>(
            offset,
            ProductSchema.deserialize,
            allOffsets,
          ) ??
          Product()) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scannedProductGetId(ScannedProduct object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scannedProductGetLinks(ScannedProduct object) {
  return [];
}

void _scannedProductAttach(
    IsarCollection<dynamic> col, Id id, ScannedProduct object) {
  object.id = id;
}

extension ScannedProductQueryWhereSort
    on QueryBuilder<ScannedProduct, ScannedProduct, QWhere> {
  QueryBuilder<ScannedProduct, ScannedProduct, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScannedProductQueryWhere
    on QueryBuilder<ScannedProduct, ScannedProduct, QWhereClause> {
  QueryBuilder<ScannedProduct, ScannedProduct, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterWhereClause> idBetween(
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
}

extension ScannedProductQueryFilter
    on QueryBuilder<ScannedProduct, ScannedProduct, QFilterCondition> {
  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition>
      scannedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'scannedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition>
      scannedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'scannedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition>
      scannedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'scannedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition>
      scannedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'scannedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScannedProductQueryObject
    on QueryBuilder<ScannedProduct, ScannedProduct, QFilterCondition> {
  QueryBuilder<ScannedProduct, ScannedProduct, QAfterFilterCondition> product(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }
}

extension ScannedProductQueryLinks
    on QueryBuilder<ScannedProduct, ScannedProduct, QFilterCondition> {}

extension ScannedProductQuerySortBy
    on QueryBuilder<ScannedProduct, ScannedProduct, QSortBy> {
  QueryBuilder<ScannedProduct, ScannedProduct, QAfterSortBy> sortByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.asc);
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterSortBy>
      sortByScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.desc);
    });
  }
}

extension ScannedProductQuerySortThenBy
    on QueryBuilder<ScannedProduct, ScannedProduct, QSortThenBy> {
  QueryBuilder<ScannedProduct, ScannedProduct, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterSortBy> thenByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.asc);
    });
  }

  QueryBuilder<ScannedProduct, ScannedProduct, QAfterSortBy>
      thenByScannedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'scannedAt', Sort.desc);
    });
  }
}

extension ScannedProductQueryWhereDistinct
    on QueryBuilder<ScannedProduct, ScannedProduct, QDistinct> {
  QueryBuilder<ScannedProduct, ScannedProduct, QDistinct>
      distinctByScannedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'scannedAt');
    });
  }
}

extension ScannedProductQueryProperty
    on QueryBuilder<ScannedProduct, ScannedProduct, QQueryProperty> {
  QueryBuilder<ScannedProduct, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScannedProduct, Product, QQueryOperations> productProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'product');
    });
  }

  QueryBuilder<ScannedProduct, DateTime, QQueryOperations> scannedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'scannedAt');
    });
  }
}
