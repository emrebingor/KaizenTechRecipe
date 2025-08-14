import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/components/boxes/calorie_icon_row_widget.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

final class RecipeListBoxWidget extends StatelessWidget {
  const RecipeListBoxWidget({
    super.key,
    required this.image,
    required this.title,
    required this.calorie,
    required this.time,
  });
  final String image;
  final String title;
  final String calorie;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 16, bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: ColorExtension.darker_blue,
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
        color: ColorExtension.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:  BorderRadius.circular(16),
            child: Image.network(
              height: 128,
              width: 168,
              image,
              fit: BoxFit.cover,
            ),
          ),

          SizedBox(height: 12),

          Text(
            title,
            style: TextStyle(
              color: ColorExtension.neutral_dark,
              fontFamily: FontFamilyEnum.sofiaPro.value,
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),

          Spacer(),

          Row(
            children: [
              CalorieIconRowWidget(
                icon: ImagePathEnum.CALORIES,
                title: calorie,
              ),

              Text('.', style: TextStyle(fontSize: 30),),

              CalorieIconRowWidget(
                icon: ImagePathEnum.TIME,
                title: time,
              ),
            ],
          )
        ],
      ),
    );
  }
}
