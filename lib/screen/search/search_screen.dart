import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/components/boxes/category_box_widget.dart';
import 'package:kaizen_tech_recipe/components/boxes/vertical_item_box_widget.dart';
import 'package:kaizen_tech_recipe/components/text_field/text_field_widget.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

final class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.white,
      appBar: AppBar(
        backgroundColor: ColorExtension.white,
        title: Text(
          'Arama',
          style: TextStyle(
            color: ColorExtension.neutral_dark,
            fontFamily: FontFamilyEnum.sofiaPro.value,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFieldWidget(controller: TextEditingController(), hintText: 'Arama'),

              SizedBox(height: 16),

              SizedBox(
                height: 41,
                child: ListView.separated(
                  itemCount: 3,
                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 12),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryBoxWidget(
                      title: 'Ana Yemek',
                    );
                  },
                ),
              ),

              SizedBox(height: 24),

              ListView.separated(
                shrinkWrap: true,
                itemCount: 3,
                separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16),
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return VerticalItemBoxWidget(
                    image: 'https://case-backend.vercel.app/images/karniyarik.jpg',
                    title: 'İskender Kebap',
                    calorie: '120 Kcal',
                    time: '20 min',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
