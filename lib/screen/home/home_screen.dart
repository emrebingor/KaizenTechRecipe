import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaizen_tech_recipe/components/boxes/category_box_widget.dart';
import 'package:kaizen_tech_recipe/components/boxes/recipe_list_box_widget.dart';
import 'package:kaizen_tech_recipe/components/text/title_text_widget.dart';
import 'package:kaizen_tech_recipe/core/base/state/base_view_state.dart';
import 'package:kaizen_tech_recipe/core/base/view/base_view.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/home/home_state.dart';
import 'package:kaizen_tech_recipe/data/provider/recipe_provider.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/models/get_category_response_model.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_response_model.dart';
import 'package:kaizen_tech_recipe/screen/home/mixin/home_screen_mixin.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/widget_extension.dart';

part './sub_screen/home_sub_screen.dart';

final class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseViewState<HomeScreen> with HomeScreenMixin {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeBloc, HomeAction, HomeState>(
      blocModel: homeBloc,
      child: PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocConsumer<HomeBloc, HomeState>(
            listener: (BuildContext context, HomeState state) {
              if(state.recipes?.isNotEmpty ?? false) {
                context.read<RecipeProvider>().setRecipeList(state.recipes!);
              }
              if(state.categories?.isNotEmpty ?? false) {
                context.read<RecipeProvider>().setCategoryList(state.categories!);
              }
            },
            builder: (BuildContext context, HomeState state) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _HeaderFieldWidget(),

                        SizedBox(height: 24),

                        _CategoryFieldWidget(
                          categories: state.categories ?? [],
                          onTap: selectedCategoryUpdate,
                          selectedCategory: state.selectedCategory,
                        ),

                        SizedBox(height: 24),

                        _RecipeFieldWidget(
                          recipes: state.filteredRecipe ?? [],
                            onTap: (id) => itemDetailNavigation(id),
                        ),
                      ],
                    ),
                  ),
                ),
              ).withLoading(state.isLoading);
            },
          ),
        ),
      ),
    );
  }
}
