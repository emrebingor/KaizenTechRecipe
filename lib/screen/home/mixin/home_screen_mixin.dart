import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/core/base/state/base_view_state.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_event.dart';
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
}