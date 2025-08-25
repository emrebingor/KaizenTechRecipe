import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

final class IngredientBoxWidget extends StatelessWidget {
  const IngredientBoxWidget({
    super.key,
    required this.icon,
    required this.title,
  });
  final ImagePathEnum icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorExtension.neutralGrey4,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(icon.getImagePath),
        ),

        SizedBox(width: 12),

        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: ColorExtension.neutralDark,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}
