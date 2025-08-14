final class GetRecipeDetailResponseModel {
  final int id;
  final String name;
  final String description;
  final String categoryId;
  final int cookTime;
  final int calories;
  final String image;
  final List<Ingredient> ingredients;
  final List<String> instructions;
  final Nutrition nutrition;

  GetRecipeDetailResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.categoryId,
    required this.cookTime,
    required this.calories,
    required this.image,
    required this.ingredients,
    required this.instructions,
    required this.nutrition,
  });

  factory GetRecipeDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return GetRecipeDetailResponseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      categoryId: json['categoryId'],
      cookTime: json['cookTime'],
      calories: json['calories'],
      image: json['image'],
      ingredients: (json['ingredients'] as List)
          .map((e) => Ingredient.fromJson(e))
          .toList(),
      instructions: List<String>.from(json['instructions']),
      nutrition: Nutrition.fromJson(json['nutrition']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'categoryId': categoryId,
      'cookTime': cookTime,
      'calories': calories,
      'image': image,
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
      'instructions': instructions,
      'nutrition': nutrition.toJson(),
    };
  }
}

final class Ingredient {
  final String name;
  final num amount;
  final String unit;

  Ingredient({
    required this.name,
    required this.amount,
    required this.unit,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      amount: json['amount'],
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount': amount,
      'unit': unit,
    };
  }
}

final class Nutrition {
  final int calories;
  final int protein;
  final int carbohydrates;
  final int fat;

  Nutrition({
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fat,
  });

  factory Nutrition.fromJson(Map<String, dynamic> json) {
    return Nutrition(
      calories: json['calories'],
      protein: json['protein'],
      carbohydrates: json['carbohydrates'],
      fat: json['fat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'protein': protein,
      'carbohydrates': carbohydrates,
      'fat': fat,
    };
  }
}
