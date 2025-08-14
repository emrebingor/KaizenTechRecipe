import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_state.dart';
import 'package:kaizen_tech_recipe/data/repository/category_repository.dart';
import 'package:kaizen_tech_recipe/data/repository/recipe_repository.dart';
import 'package:kaizen_tech_recipe/domain/use_case/category_use_case.dart';
import 'package:kaizen_tech_recipe/domain/use_case/recipe_use_case.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

final class HomeBloc extends BaseBloc<HomeAction, HomeState> {
  final RecipeUseCase _recipeUseCase;
  final CategoryUseCase _categoryUseCase;

  HomeBloc({RecipeUseCase? recipeUseCase, CategoryUseCase? categoryUseCase})
      : _recipeUseCase = recipeUseCase ?? RecipeUseCase(RecipeRepository()),
        _categoryUseCase = categoryUseCase ?? CategoryUseCase(CategoryRepository()),
        super(HomeState()) {
    on<HomeInitAction>(_homeInitAction);
  }

  Future<void> _homeInitAction(HomeInitAction event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final List<GetRecipeResponseModel> recipes = await _recipeUseCase.getRecipe();
      final List<GetCategoryResponseModel> categories = await _categoryUseCase.getCategories();

      emit(state.copyWith(
        isLoading: false,
        recipes: recipes,
        categories: categories,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
