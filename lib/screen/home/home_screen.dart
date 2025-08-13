import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaizen_tech_recipe/components/boxes/category_box_widget.dart';
import 'package:kaizen_tech_recipe/components/boxes/recipe_list_box_widget.dart';
import 'package:kaizen_tech_recipe/components/text/title_text_widget.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

part './sub_screen/home_sub_screen.dart';

final class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _HeaderFieldWidget(),

              SizedBox(height: 24),

              _CategoryFieldWidget(),

              SizedBox(height: 24),

              _RecipeFieldWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
