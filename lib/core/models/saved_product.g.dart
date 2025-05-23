// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saved_product.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSavedProductCollection on Isar {
  IsarCollection<SavedProduct> get savedProducts => this.collection();
}

const SavedProductSchema = CollectionSchema(
  name: r'SavedProduct',
  id: 8603401742936513962,
  properties: {
    r'product': PropertySchema(
      id: 0,
      name: r'product',
      type: IsarType.object,
      target: r'Product',
    )
  },
  estimateSize: _savedProductEstimateSize,
  serialize: _savedProductSerialize,
  deserialize: _savedProductDeserialize,
  deserializeProp: _savedProductDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Product': ProductSchema},
  getId: _savedProductGetId,
  getLinks: _savedProductGetLinks,
  attach: _savedProductAttach,
  version: '3.1.0+1',
);

int _savedProductEstimateSize(
  SavedProduct object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 +
      ProductSchema.estimateSize(
          object.product, allOffsets[Product]!, allOffsets);
  return bytesCount;
}

void _savedProductSerialize(
  SavedProduct object,
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
}

SavedProduct _savedProductDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SavedProduct();
  object.id = id;
  object.product = reader.readObjectOrNull<Product>(
        offsets[0],
        ProductSchema.deserialize,
        allOffsets,
      ) ??
      Product();
  return object;
}

P _savedProductDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _savedProductGetId(SavedProduct object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _savedProductGetLinks(SavedProduct object) {
  return [];
}

void _savedProductAttach(
    IsarCollection<dynamic> col, Id id, SavedProduct object) {
  object.id = id;
}

extension SavedProductQueryWhereSort
    on QueryBuilder<SavedProduct, SavedProduct, QWhere> {
  QueryBuilder<SavedProduct, SavedProduct, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SavedProductQueryWhere
    on QueryBuilder<SavedProduct, SavedProduct, QWhereClause> {
  QueryBuilder<SavedProduct, SavedProduct, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SavedProduct, SavedProduct, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<SavedProduct, SavedProduct, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SavedProduct, SavedProduct, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SavedProduct, SavedProduct, QAfterWhereClause> idBetween(
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

extension SavedProductQueryFilter
    on QueryBuilder<SavedProduct, SavedProduct, QFilterCondition> {
  QueryBuilder<SavedProduct, SavedProduct, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SavedProduct, SavedProduct, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SavedProduct, SavedProduct, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SavedProduct, SavedProduct, QAfterFilterCondition> idBetween(
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
}

extension SavedProductQueryObject
    on QueryBuilder<SavedProduct, SavedProduct, QFilterCondition> {
  QueryBuilder<SavedProduct, SavedProduct, QAfterFilterCondition> product(
      FilterQuery<Product> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'product');
    });
  }
}

extension SavedProductQueryLinks
    on QueryBuilder<SavedProduct, SavedProduct, QFilterCondition> {}

extension SavedProductQuerySortBy
    on QueryBuilder<SavedProduct, SavedProduct, QSortBy> {}

extension SavedProductQuerySortThenBy
    on QueryBuilder<SavedProduct, SavedProduct, QSortThenBy> {
  QueryBuilder<SavedProduct, SavedProduct, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SavedProduct, SavedProduct, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension SavedProductQueryWhereDistinct
    on QueryBuilder<SavedProduct, SavedProduct, QDistinct> {}

extension SavedProductQueryProperty
    on QueryBuilder<SavedProduct, SavedProduct, QQueryProperty> {
  QueryBuilder<SavedProduct, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SavedProduct, Product, QQueryOperations> productProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'product');
    });
  }
}
