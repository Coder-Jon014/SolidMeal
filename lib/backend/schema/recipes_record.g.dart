// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RecipesRecord> _$recipesRecordSerializer =
    new _$RecipesRecordSerializer();

class _$RecipesRecordSerializer implements StructuredSerializer<RecipesRecord> {
  @override
  final Iterable<Type> types = const [RecipesRecord, _$RecipesRecord];
  @override
  final String wireName = 'RecipesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RecipesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.recipeId;
    if (value != null) {
      result
        ..add('recipe_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  RecipesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RecipesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'recipe_id':
          result.recipeId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$RecipesRecord extends RecipesRecord {
  @override
  final String? recipeId;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RecipesRecord([void Function(RecipesRecordBuilder)? updates]) =>
      (new RecipesRecordBuilder()..update(updates))._build();

  _$RecipesRecord._({this.recipeId, this.ffRef}) : super._();

  @override
  RecipesRecord rebuild(void Function(RecipesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RecipesRecordBuilder toBuilder() => new RecipesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RecipesRecord &&
        recipeId == other.recipeId &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, recipeId.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RecipesRecord')
          ..add('recipeId', recipeId)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RecipesRecordBuilder
    implements Builder<RecipesRecord, RecipesRecordBuilder> {
  _$RecipesRecord? _$v;

  String? _recipeId;
  String? get recipeId => _$this._recipeId;
  set recipeId(String? recipeId) => _$this._recipeId = recipeId;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RecipesRecordBuilder() {
    RecipesRecord._initializeBuilder(this);
  }

  RecipesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _recipeId = $v.recipeId;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RecipesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RecipesRecord;
  }

  @override
  void update(void Function(RecipesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RecipesRecord build() => _build();

  _$RecipesRecord _build() {
    final _$result =
        _$v ?? new _$RecipesRecord._(recipeId: recipeId, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
