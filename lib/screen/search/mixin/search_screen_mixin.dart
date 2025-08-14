import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizen_tech_recipe/core/base/state/base_view_state.dart';
import 'package:kaizen_tech_recipe/core/navigation/route_paths.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_bloc.dart';
import 'package:kaizen_tech_recipe/data/provider/recipe_provider.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';
import 'package:kaizen_tech_recipe/screen/search/search_screen.dart';

import '../../../data/bloc/search/search_screen_event.dart';

mixin SearchScreenMixin on BaseViewState<SearchScreen> {
  final SearchBloc _searchBloc = SearchBloc();
  SearchBloc get searchBloc => _searchBloc;
  late final TextEditingController _searchController;

  TextEditingController get searchController => _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _searchBloc.add(SearchScreenInitAction(context.read<RecipeProvider>().recipes));
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void selectedCategoryUpdate(GetCategoryResponseModel category, List<GetRecipeResponseModel> recipe) {
    _searchBloc.add(SelectedCategoryUpdate(category, recipe));
  }

  void searchFieldUpdate(String value) {
    final allRecipes = context.read<RecipeProvider>().recipes;
    _searchBloc.add(SearchRecipeEvent(query: value, recipe: allRecipes));
  }

  void itemDetailNavigation(int id) {
    context.push(RoutePaths.itemDetail.replaceFirst(':id', '$id'));
  }
}