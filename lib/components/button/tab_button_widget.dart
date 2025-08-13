import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

final class TabButton extends StatelessWidget {
  final String text;
  final int index;
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const TabButton({
    super.key,
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? ColorExtension.neutral_dark : Colors.transparent,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: FontFamilyEnum.sofiaPro.value,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: isSelected ? Colors.white : ColorExtension.neutral_dark
              ),
            ),
          ),
        ),
      ),
    );
  }
}