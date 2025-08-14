import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_bloc.dart';

List<BlocProvider> appBlocProviders = [
  BlocProvider<HomeBloc>(
    create: (_) => HomeBloc(),
  ),
];
