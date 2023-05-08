import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'recipes_record.g.dart';

abstract class RecipesRecord
    implements Built<RecipesRecord, RecipesRecordBuilder> {
  static Serializer<RecipesRecord> get serializer => _$recipesRecordSerializer;

  @BuiltValueField(wireName: 'recipe_id')
  String? get recipeId;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RecipesRecordBuilder builder) =>
      builder..recipeId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('recipes');

  static Stream<RecipesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RecipesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RecipesRecord._();
  factory RecipesRecord([void Function(RecipesRecordBuilder) updates]) =
      _$RecipesRecord;

  static RecipesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRecipesRecordData({
  String? recipeId,
}) {
  final firestoreData = serializers.toFirestore(
    RecipesRecord.serializer,
    RecipesRecord(
      (r) => r..recipeId = recipeId,
    ),
  );

  return firestoreData;
}
