import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaizen_tech_recipe/components/boxes/calorie_icon_row_widget.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

final class RecipeListBoxWidget extends StatelessWidget {
  const RecipeListBoxWidget({
    super.key,
    required this.recipe,
  });
  final GetRecipeResponseModel recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorExtension.darkerBlue,
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
        color: ColorExtension.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              _ImageWidget(image: recipe.image ?? ''),

              _HeartIconWidget(),
            ],
          ),

          SizedBox(height: 12),

          Text(
            recipe.name ?? '',
            style: TextStyle(
              color: ColorExtension.neutralDark,
              fontFamily: FontFamilyEnum.sofiaPro.value,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),

          Spacer(),

          _CalorieTimeRowWidget(
            calorie: recipe.calories ?? 0,
            time: recipe.cookTime ?? 0,
          ),
        ],
      ),
    );
  }
}

final class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.image,
  });
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:  BorderRadius.circular(16),
      child: image?.isEmpty ?? false ? Container(
        height: 128,
        width: 168,
        color: ColorExtension.neutralGrey4,
        child: const Icon(
          Icons.image_not_supported,
          size: 60,
          color: Colors.grey,
        ),
      ) : Image.network(
        height: 128,
        width: 168,
        image!,
        fit: BoxFit.cover,
      ),
    );
  }
}

final class _HeartIconWidget extends StatelessWidget {
  const _HeartIconWidget();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 12,
      top: 12,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorExtension.white,
        ),
        child: SvgPicture.asset(
          ImagePathEnum.heart.getImagePath,
        ),
      ),
    );
  }
}

final class _CalorieTimeRowWidget extends StatelessWidget {
  const _CalorieTimeRowWidget({
    required this.calorie,
    required this.time,
  });
  final int calorie;
  final int time;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CalorieIconRowWidget(
          icon: ImagePathEnum.calories,
          title: '$calorie Kcal',
        ),

        SizedBox(width: 8),

        Text(
          '.',
          style: TextStyle(
            color: ColorExtension.neutralGrey2,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),

        SizedBox(width: 8),

        CalorieIconRowWidget(
          icon: ImagePathEnum.time,
          title: '$time Min',
        ),
      ],
    );
  }
}
