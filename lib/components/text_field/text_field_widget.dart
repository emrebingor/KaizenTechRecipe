import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

final class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.controller, required this.hintText, this.onChanged});
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 2,
          color: ColorExtension.neutral_grey_4,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Row(
        children: [
          SvgPicture.asset(ImagePathEnum.TEXT_FIELD_SEARCH.getImagePath),

          const SizedBox(width: 16),

          Expanded(
            child: TextField(
              onChanged: onChanged,
              controller: controller,
              cursorColor: ColorExtension.white,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(color: ColorExtension.neutral_grey_2),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
