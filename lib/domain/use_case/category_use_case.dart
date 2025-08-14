import 'package:kaizen_tech_recipe/data/repository/category_repository.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';

final class CategoryUseCase {
  final CategoryRepository _repository;

  CategoryUseCase(this._repository);

  Future<List<GetCategoryResponseModel>> getCategories() async =>
      await _repository.getCategories();
}