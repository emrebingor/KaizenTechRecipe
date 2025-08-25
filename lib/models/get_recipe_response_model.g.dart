// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recipe_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecipeResponseModel _$GetRecipeResponseModelFromJson(
  Map<String, dynamic> json,
) => GetRecipeResponseModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  categoryId: json['category_id'] as String?,
  category: json['category'] as String?,
  cookTime: (json['cook_time'] as num?)?.toInt(),
  calories: (json['calories'] as num?)?.toInt(),
  image: json['image'] as String?,
);

Map<String, dynamic> _$GetRecipeResponseModelToJson(
  GetRecipeResponseModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'description': instance.description,
  'category_id': instance.categoryId,
  'category': instance.category,
  'image': instance.image,
  'id': instance.id,
  'cook_time': instance.cookTime,
  'calories': instance.calories,
};
