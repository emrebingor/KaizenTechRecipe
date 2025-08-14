import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizen_tech_recipe/core/navigation/route_paths.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

final class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              ImagePathEnum.ONBOARDING.getImagePath,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            top: 64,
            right: 31,
            child: InkWell(
              onTap: () {
                context.push(RoutePaths.tab);
              },
              child: Text(
                'Atla',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: FontFamilyEnum.sofiaPro.value,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
