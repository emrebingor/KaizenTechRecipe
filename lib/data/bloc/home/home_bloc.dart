import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_state.dart';
import 'package:kaizen_tech_recipe/data/repository/recipe_repository.dart';
import 'package:kaizen_tech_recipe/domain/use_case/recipe_use_case.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

final class HomeBloc extends BaseBloc<HomeAction, HomeState> {
  final RecipeUseCase _recipeUseCase;

  HomeBloc({RecipeUseCase? recipeUseCase})
      : _recipeUseCase = recipeUseCase ?? RecipeUseCase(RecipeRepository()),
        super(HomeState()) {
    on<HomeInitAction>(_homeInitAction);
  }

  Future<void> _homeInitAction(HomeInitAction event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final List<GetRecipeResponseModel> recipes = await _recipeUseCase.getRecipe();
      emit(state.copyWith(
        isLoading: false,
        recipes: recipes,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
