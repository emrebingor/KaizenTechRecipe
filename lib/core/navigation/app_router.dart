import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizen_tech_recipe/core/navigation/route_paths.dart';
import 'package:kaizen_tech_recipe/screen/home/home_screen.dart';
import 'package:kaizen_tech_recipe/screen/item_detail/item_detail_screen.dart';
import 'package:kaizen_tech_recipe/screen/onboarding/onboarding_screen.dart';
import 'package:kaizen_tech_recipe/screen/search/search_screen.dart';
import 'package:kaizen_tech_recipe/screen/tab/tab_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: RoutePaths.onBoarding,
  routes: [
    GoRoute(
      path: RoutePaths.onBoarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: RoutePaths.tab,
      builder: (context, state) => const TabScreen(),
    ),
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: RoutePaths.search,
      builder: (context, state) => const SearchScreen(),
    ),
    GoRoute(
      path: '/itemDetail/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ItemDetailScreen(id: id);
      },
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Page not found: ${state.uri.path}'),
    ),
  ),
);
