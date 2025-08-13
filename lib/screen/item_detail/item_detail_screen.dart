import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizen_tech_recipe/components/boxes/ingredient_box_widget.dart';
import 'package:kaizen_tech_recipe/components/button/tab_button_widget.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

part './sub_screen/item_detail_sub_screen.dart';

final class ItemDetailScreen extends StatelessWidget {
  const ItemDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _ImageWidget(),

          _ToolBarWidget(),
        ],
      ),
      bottomSheet: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          color: ColorExtension.white,
          height: MediaQuery.of(context).size.height * 0.7,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                _ItemInformationRowWidget(),

                SizedBox(height: 6),

                _InformationTextWidget(),

                SizedBox(height: 16),

                _StatColumnWidget(),

                SizedBox(height: 24),

                _TabBarWidget(),

                SizedBox(height: 24),

                _IngredientInstructionFieldWidget(),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
