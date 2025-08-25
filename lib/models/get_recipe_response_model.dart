import 'package:json_annotation/json_annotation.dart';

part 'get_recipe_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
final class GetRecipeResponseModel {
  GetRecipeResponseModel({
    this.id,
    this.name,
    this.description,
    this.categoryId,
    this.category,
    this.cookTime,
    this.calories,
    this.image,
  });

  factory GetRecipeResponseModel.fromJson(Map<String, dynamic> json) =>
      GetRecipeResponseModel(
        id: json['id'] is int ? json['id'] as int : null,
        name: json['name'] as String?,
        description: json['description'] as String?,
        categoryId: json['categoryId'] as String?,
        category: json['category'] as String?,
        cookTime: json['cookTime'] as int?,
        calories: json['calories'] as int?,
        image: json['image'] as String?,
      );

  static List<GetRecipeResponseModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList
        .map((e) => GetRecipeResponseModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  String? name;
  String? description;
  String? categoryId;
  String? category;
  String? image;
  int? id;
  int? cookTime;
  int? calories;

  Map<String, dynamic> toJson() => {
    'id': id,
    'cookTime': cookTime,
    'calories': calories,
    'image': image,
    'description': description,
    'categoryId': categoryId,
    'category': category,
    'name': name,
  };
}
