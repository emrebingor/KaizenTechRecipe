import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/core/navigation/app_router.dart';
import 'package:kaizen_tech_recipe/data/provider/recipe_provider.dart';
import 'package:kaizen_tech_recipe/data/provider/tab_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

final class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabProvider()),
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter,
        theme: ThemeData(
          fontFamily: 'SofiaPro',
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}