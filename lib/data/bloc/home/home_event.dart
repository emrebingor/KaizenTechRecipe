import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';

@immutable
abstract class HomeAction {
  const HomeAction();
}

@immutable
final class HomeInitAction extends HomeAction {
  const HomeInitAction();
}

@immutable
final class SelectedCategoryUpdate extends HomeAction {
  const SelectedCategoryUpdate(this.category);
  final GetCategoryResponseModel category;
}