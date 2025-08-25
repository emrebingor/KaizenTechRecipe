// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoryResponseModel _$GetCategoryResponseModelFromJson(
  Map<String, dynamic> json,
) => GetCategoryResponseModel(
  id: json['id'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
);

Map<String, dynamic> _$GetCategoryResponseModelToJson(
  GetCategoryResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
};
