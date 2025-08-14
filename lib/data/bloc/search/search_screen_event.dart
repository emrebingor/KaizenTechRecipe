import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';

@immutable
abstract class SearchScreenAction {
  const SearchScreenAction();
}

@immutable
final class SearchScreenInitAction extends SearchScreenAction {
  const SearchScreenInitAction(this.recipe);
  final List<GetRecipeResponseModel> recipe;
}

final class SearchRecipeEvent extends SearchScreenAction {
  const SearchRecipeEvent({required this.query, required this.recipe});
  final String query;
  final List<GetRecipeResponseModel>? recipe;
}

@immutable
final class SelectedCategoryUpdate extends SearchScreenAction {
  const SelectedCategoryUpdate(this.category, this.recipe);
  final GetCategoryResponseModel category;
  final List<GetRecipeResponseModel> recipe;
}