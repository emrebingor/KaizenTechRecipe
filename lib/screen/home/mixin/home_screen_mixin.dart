import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizen_tech_recipe/core/base/state/base_view_state.dart';
import 'package:kaizen_tech_recipe/core/navigation/route_paths.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_event.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/screen/home/home_screen.dart';

mixin HomeScreenMixin on BaseViewState<HomeScreen> {
  final HomeBloc _homeBloc = HomeBloc();
  HomeBloc get homeBloc => _homeBloc;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _homeBloc.add(const HomeInitAction());
    });
  }

  void selectedCategoryUpdate(GetCategoryResponseModel category) {
    _homeBloc.add(SelectedCategoryUpdate(category));
  }

  void itemDetailNavigation(int id) {
    context.push(RoutePaths.itemDetail.replaceFirst(':id', '$id'));
  }
}