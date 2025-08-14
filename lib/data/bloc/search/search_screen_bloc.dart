import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_state.dart';
import 'package:kaizen_tech_recipe/domain/use_case/category_use_case.dart';
import 'package:kaizen_tech_recipe/domain/use_case/recipe_use_case.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

final class SearchBloc extends BaseBloc<SearchScreenAction, SearchScreenState> {

  SearchBloc({RecipeUseCase? recipeUseCase, CategoryUseCase? categoryUseCase})
      : super(SearchScreenState()) {
    on<SelectedCategoryUpdate>(_updateSelectedCategory);
    on<SearchScreenInitAction>(_searchInitAction);
    on<SearchRecipeEvent>(_searchRecipe);
  }

  Future<void> _searchInitAction(SearchScreenInitAction event, Emitter<SearchScreenState> emit) async {
    emit(state.copyWith(filteredRecipe: event.recipe));
  }

  Future<void> _searchRecipe(SearchRecipeEvent event, Emitter<SearchScreenState> emit) async {
    final query = event.query.toLowerCase();

    if (event.recipe == null) {
      emit(state.copyWith(filteredRecipe: []));
      return;
    }

    final filtered = event.recipe!
        .where((recipe) => recipe.name?.toLowerCase().startsWith(query) ?? false)
        .toList();

    emit(state.copyWith(filteredRecipe: filtered));
  }

  Future<void> _updateSelectedCategory(SelectedCategoryUpdate event, Emitter<SearchScreenState> emit) async {
    List<GetRecipeResponseModel> filteredRecipes = [];

    if (state.selectedCategory?.id == event.category.id) {
      emit(
        state.copyWith(
          selectedCategory: null,
          filteredRecipe: event.recipe,
        ),
      );
      return;
    }

    if (event.recipe != null) {
      filteredRecipes = event.recipe.where((recipe) => recipe.categoryId == event.category.id).toList();
    }

    emit(state.copyWith(selectedCategory: event.category, filteredRecipe: filteredRecipes));
  }
}
