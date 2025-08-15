import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

final class CategoryBoxWidget extends StatelessWidget {
  const CategoryBoxWidget({super.key, required this.category, required this.selectedCategory});
  final GetCategoryResponseModel category;
  final GetCategoryResponseModel? selectedCategory;

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedCategory != null && category.id == selectedCategory!.id;
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
        category.name ?? '',
        style: TextStyle(
          color: isSelected && selectedCategory?.id != 'empty' ? ColorExtension.white : ColorExtension.neutral_dark,
          fontFamily: FontFamilyEnum.sofiaPro.value,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
