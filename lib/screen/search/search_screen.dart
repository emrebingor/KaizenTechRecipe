import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaizen_tech_recipe/components/boxes/category_box_widget.dart';
import 'package:kaizen_tech_recipe/components/boxes/vertical_item_box_widget.dart';
import 'package:kaizen_tech_recipe/components/text_field/text_field_widget.dart';
import 'package:kaizen_tech_recipe/core/base/state/base_view_state.dart';
import 'package:kaizen_tech_recipe/core/base/view/base_view.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/search/search_screen_state.dart';
import 'package:kaizen_tech_recipe/data/provider/recipe_provider.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';
import 'package:kaizen_tech_recipe/screen/search/mixin/search_screen_mixin.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';

final class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final class _SearchScreenState extends BaseViewState<SearchScreen> with SearchScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<SearchBloc, SearchScreenAction, SearchScreenState>(
      blocModel: searchBloc,
      child: Scaffold(
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
        body: BlocConsumer<SearchBloc, SearchScreenState>(
          listener: (BuildContext context, SearchScreenState state) {},
          builder: (BuildContext context, SearchScreenState state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      TextFieldWidget(controller: searchController, hintText: 'Arama'),

                      SizedBox(height: 16),

                      SizedBox(
                        height: 41,
                        child: ListView.separated(
                          itemCount: context.watch<RecipeProvider>().categoryList.length,
                          separatorBuilder: (BuildContext context, int index) => SizedBox(width: 12),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            final GetCategoryResponseModel category = context.watch<RecipeProvider>().categoryList[index];
                            return CategoryBoxWidget(
                              title: category.name ?? '', isSelected: false,
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 24),

                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: context.watch<RecipeProvider>().recipes.length,
                        separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16),
                        scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final GetRecipeResponseModel recipe = context.watch<RecipeProvider>().recipes[index];
                          return InkWell(
                            onTap: () {
                              if(recipe.id != null) {
                                itemDetailNavigation(recipe.id!);
                              }
                            },
                            child: VerticalItemBoxWidget(
                              image: recipe.image ?? '',
                              title: recipe.name ?? '',
                              calorie: '${recipe.calories} Kcal',
                              time: '${recipe.cookTime} min',
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
