import 'package:kaizen_tech_recipe/core/base/bloc/base_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_state.dart';
import 'package:kaizen_tech_recipe/domain/use_case/category_use_case.dart';
import 'package:kaizen_tech_recipe/domain/use_case/recipe_use_case.dart';

final class SearchBloc extends BaseBloc<SearchScreenAction, SearchScreenState> {

  SearchBloc({RecipeUseCase? recipeUseCase, CategoryUseCase? categoryUseCase})
      : super(SearchScreenState());
}
