import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

final class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: ColorExtension.neutralDark,
        fontFamily: FontFamilyEnum.sofiaPro.value,
      ),
    );
  }
}
