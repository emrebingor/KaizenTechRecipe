import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/data/provider/tab_provider.dart';
import 'package:kaizen_tech_recipe/screen/tab/tab_screen.dart';
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
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'SofiaPro',
        ),
        debugShowCheckedModeBanner: false,
        home: const TabScreen(),
      ),
    );
  }
}