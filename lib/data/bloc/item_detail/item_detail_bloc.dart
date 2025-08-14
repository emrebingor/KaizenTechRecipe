import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/item_detail/item_detail_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/item_detail/item_detail_state.dart';
import 'package:kaizen_tech_recipe/data/repository/recipe_repository.dart';
import 'package:kaizen_tech_recipe/domain/use_case/recipe_use_case.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_detail_response_model.dart';

final class ItemDetailBloc extends BaseBloc<ItemDetailAction, ItemDetailState> {
  final RecipeUseCase _recipeUseCase;

  ItemDetailBloc({RecipeUseCase? recipeUseCase})
      : _recipeUseCase = recipeUseCase ?? RecipeUseCase(RecipeRepository()),
        super(ItemDetailState()) {
    on<ItemDetailInitAction>(_itemDetailInitAction);
    on<ChangeSelectedTabEvent>(_updateSelectedTab);
  }

  Future<void> _itemDetailInitAction(ItemDetailInitAction event, Emitter<ItemDetailState> emit) async {
    emit(state.copyWith(isLoading: true));

    try {
      final GetRecipeDetailResponseModel recipe = await _recipeUseCase.getRecipeById(event.id);

      emit(state.copyWith(
        recipe: recipe,
        isLoading: false,
      ));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _updateSelectedTab(ChangeSelectedTabEvent event, Emitter<ItemDetailState> emit) async {
    emit(state.copyWith(selectedTab: event.selectedTab));
  }
}
