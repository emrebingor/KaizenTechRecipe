import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kaizen_tech_recipe/components/boxes/ingredient_box_widget.dart';
import 'package:kaizen_tech_recipe/components/button/tab_button_widget.dart';
import 'package:kaizen_tech_recipe/core/base/state/base_view_state.dart';
import 'package:kaizen_tech_recipe/core/base/view/base_view.dart';
import 'package:kaizen_tech_recipe/data/bloc/item_detail/item_detail_bloc.dart';
import 'package:kaizen_tech_recipe/data/bloc/item_detail/item_detail_event.dart';
import 'package:kaizen_tech_recipe/data/bloc/item_detail/item_detail_state.dart';
import 'package:kaizen_tech_recipe/enum/font_family_enum.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/enum/tab_type_enum.dart';
import 'package:kaizen_tech_recipe/models/get_recipe_detail_response_model.dart';
import 'package:kaizen_tech_recipe/screen/item_detail/mixin/item_detail_screen_mixin.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/widget_extension.dart';

part './sub_screen/item_detail_sub_screen.dart';

final class ItemDetailScreen extends StatefulWidget {
  const ItemDetailScreen({super.key, required this.id});
  final String? id;

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends BaseViewState<ItemDetailScreen> with ItemDetailScreenMixin {

  @override
  Widget build(BuildContext context) {
    return BaseView<ItemDetailBloc, ItemDetailAction, ItemDetailState>(
      blocModel: itemDetailBloc,
      child: BlocConsumer<ItemDetailBloc, ItemDetailState>(
        listener: (BuildContext context, ItemDetailState state) {},
        builder: (BuildContext context, ItemDetailState state) {
          return Scaffold(
            body: Stack(
              children: [
                _ImageWidget(image: state.recipe?.image ?? ''),

                _ToolBarWidget(),
              ],
            ),
            bottomSheet: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 40),
                color: ColorExtension.white,
                height: MediaQuery.of(context).size.height * 0.7,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          children: [
                            _ItemInformationRowWidget(
                              title: state.recipe?.name ?? '',
                              min: state.recipe?.cookTime ?? 0,
                            ),

                            SizedBox(height: 6),

                            _InformationTextWidget(
                              description: state.recipe?.description ?? '',
                            ),

                            SizedBox(height: 16),

                            _StatColumnWidget(
                              fat: state.recipe?.nutrition.fat ?? 0,
                              protein: state.recipe?.nutrition.protein ?? 0,
                              cal: state.recipe?.nutrition.calories?? 0,
                              carb: state.recipe?.nutrition.carbohydrates ?? 0,
                            ),

                            SizedBox(height: 24),

                            _TabBarWidget(
                              selectedTab: state.selectedTab,
                              onTabChanged: (TabType tab) {
                                itemDetailBloc.add(ChangeSelectedTabEvent(tab));
                              },
                            ),
                          ],
                        ),
                      ),


                      state.recipe == null ? SizedBox.shrink() : _IngredientInstructionFieldWidget(
                        selectedTab: state.selectedTab,
                        recipe: state.recipe!,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ).withLoading(state.isLoading);
        },
      ),
    );
  }
}
