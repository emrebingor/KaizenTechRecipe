import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kaizen_tech_recipe/components/boxes/calorie_icon_row_widget.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

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
          Stack(
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

              Positioned(
                right: 12,
                top: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorExtension.white
                  ),
                  child: SvgPicture.asset(ImagePathEnum.HEART.getImagePath),
                ),
              )
            ],
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

              SizedBox(width: 8),

              Text(
                '.',
                style: TextStyle(
                  color: ColorExtension.neutral_grey_2,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),

              SizedBox(width: 8),

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
