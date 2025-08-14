import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

final class RecipeProvider extends ChangeNotifier {
  List<GetRecipeResponseModel> _recipes = [];
  List<GetCategoryResponseModel> _categoryList = [];

  List<GetRecipeResponseModel> get recipes => _recipes;
  List<GetCategoryResponseModel> get categoryList => _categoryList;

  void setRecipeList(List<GetRecipeResponseModel> recipeList) {
    _recipes = recipeList;
    notifyListeners();
  }

  void setCategoryList(List<GetCategoryResponseModel> category) {
    _categoryList = category;
    notifyListeners();
  }
}