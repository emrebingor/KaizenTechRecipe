import 'package:dio/dio.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_detail_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';
import 'package:kaizen_tech_recipe/utils/network/network_manager.dart';

final class RecipeRepository {
  final networkManager = NetworkManager();

  Future<List<GetRecipeResponseModel>> getRecipe() async {
    try {
      final Response response = await networkManager.get(
        '/api/recipes',
      );

      if (response.statusCode == 200 && response.data != null) {
        return GetRecipeResponseModel.fromJsonList(response.data as List<dynamic>);
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<GetRecipeDetailResponseModel> getRecipeById(String id) async {
    try {
      final Response response = await networkManager.get(
        '/api/recipes/$id',
      );

      if (response.statusCode == 200 && response.data != null) {
        return GetRecipeDetailResponseModel.fromJson(response.data);
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
