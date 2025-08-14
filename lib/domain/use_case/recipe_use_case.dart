import 'package:kaizen_tech_recipe/data/repository/recipe_repository.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_detail_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

final class RecipeUseCase {
  final RecipeRepository _repository;

  RecipeUseCase(this._repository);

  Future<List<GetRecipeResponseModel>> getRecipe() async =>
      await _repository.getRecipe();
  Future<GetRecipeDetailResponseModel> getRecipeById(String id) async =>
      await _repository.getRecipeById(id);
}