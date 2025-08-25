// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_recipe_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRecipeDetailResponseModel _$GetRecipeDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => GetRecipeDetailResponseModel(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  categoryId: json['category_id'] as String,
  cookTime: (json['cook_time'] as num).toInt(),
  calories: (json['calories'] as num).toInt(),
  image: json['image'] as String,
  ingredients:
      (json['ingredients'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
  instructions:
      (json['instructions'] as List<dynamic>).map((e) => e as String).toList(),
  nutrition: Nutrition.fromJson(json['nutrition'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetRecipeDetailResponseModelToJson(
  GetRecipeDetailResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'category_id': instance.categoryId,
  'cook_time': instance.cookTime,
  'calories': instance.calories,
  'image': instance.image,
  'ingredients': instance.ingredients,
  'instructions': instance.instructions,
  'nutrition': instance.nutrition,
};

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
  name: json['name'] as String,
  amount: json['amount'] as num,
  unit: json['unit'] as String,
);

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'name': instance.name,
      'amount': instance.amount,
      'unit': instance.unit,
    };

Nutrition _$NutritionFromJson(Map<String, dynamic> json) => Nutrition(
  calories: (json['calories'] as num).toInt(),
  protein: (json['protein'] as num).toInt(),
  carbohydrates: (json['carbohydrates'] as num).toInt(),
  fat: (json['fat'] as num).toInt(),
);

Map<String, dynamic> _$NutritionToJson(Nutrition instance) => <String, dynamic>{
  'calories': instance.calories,
  'protein': instance.protein,
  'carbohydrates': instance.carbohydrates,
  'fat': instance.fat,
};
