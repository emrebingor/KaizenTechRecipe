import 'package:dio/dio.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/utils/network/network_manager.dart';

final class CategoryRepository {
  final networkManager = NetworkManager();

  Future<List<GetCategoryResponseModel>> getCategories() async {
    try {
      final Response response = await networkManager.get(
        '/api/categories',
      );

      if (response.statusCode == 200 && response.data != null) {
        return GetCategoryResponseModel.fromJsonList(response.data as List<dynamic>);
      } else {
        throw Exception('Unexpected response: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
