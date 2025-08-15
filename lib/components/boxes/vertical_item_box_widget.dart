import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaizen_tech_recipe/components/boxes/calorie_icon_row_widget.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';

final class VerticalItemBoxWidget extends StatelessWidget {
  const VerticalItemBoxWidget({
    super.key,
    required this.recipe,
  });
  final GetRecipeResponseModel? recipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: ColorExtension.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorExtension.light_white,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorExtension.darker_blue,
            blurRadius: 16,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          _ImageWidget(image: recipe?.image ?? ''),

          SizedBox(width: 16),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TitleTextWidget(
                title: recipe?.name ?? '',
              ),

              Spacer(),

              _TimeCalorieRowWidget(
                calorie: recipe?.calories ?? 0,
                time: recipe?.cookTime ?? 0,
              ),
            ],
          ),


          _ArrowIconWidget(),
        ],
      ),
    );
  }
}

final class _ImageWidget extends StatelessWidget {
  const _ImageWidget({
    required this.image,
  });
  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: image.isEmpty ? Container(
        height: 84,
        width: 100,
        color: ColorExtension.neutral_grey_4,
        child: const Icon(
          Icons.image_not_supported,
          size: 60,
          color: Colors.grey,
        ),
      ) : Image.network(
        height: 84,
        width: 100,
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}

final class _TitleTextWidget extends StatelessWidget {
  const _TitleTextWidget({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: ColorExtension.neutral_dark,
        fontFamily: FontFamilyEnum.sofiaPro.value,
      ),
    );
  }
}

final class _TimeCalorieRowWidget extends StatelessWidget {
  const _TimeCalorieRowWidget({
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
          icon: ImagePathEnum.CALORIES,
          title: '$calorie Kcal',
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
          title: '$time Dk',
        )
      ],
    );
  }
}

final class _ArrowIconWidget extends StatelessWidget {
  const _ArrowIconWidget();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: CircleAvatar(
          radius: 14,
          backgroundColor: ColorExtension.brand_primary,
          child: SvgPicture.asset(
            ImagePathEnum.ARROW_RIGHT.getImagePath,
          ),
        ),
      ),
    );
  }
}
