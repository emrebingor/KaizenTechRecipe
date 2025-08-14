import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/core/bloc_providers.dart';
import 'package:kaizen_tech_recipe/core/navigation/app_router.dart';
import 'package:kaizen_tech_recipe/data/provider/tab_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ...appBlocProviders,
        ChangeNotifierProvider(create: (_) => TabProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: ThemeData(
          fontFamily: 'SofiaPro',
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}