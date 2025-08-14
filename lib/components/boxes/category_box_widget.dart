import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

final class CategoryBoxWidget extends StatelessWidget {
  const CategoryBoxWidget({super.key, required this.title, required this.isSelected});
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 9,
        horizontal: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: isSelected ? ColorExtension.brand_secondary : ColorExtension.light_grey,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? ColorExtension.white : ColorExtension.neutral_dark,
          fontFamily: FontFamilyEnum.sofiaPro.value,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
