import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

final class CalorieIconRowWidget extends StatelessWidget {
  const CalorieIconRowWidget({
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
        SvgPicture.asset(icon.getImagePath),
        SizedBox(width: 2),
        Text(
          title,
          style: TextStyle(
            color: ColorExtension.neutralGrey2,
            fontFamily: FontFamilyEnum.sofiaPro.value,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
