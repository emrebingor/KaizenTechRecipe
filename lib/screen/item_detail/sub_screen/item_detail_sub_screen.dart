part of '../item_detail_screen.dart';

final class _TabBarWidget extends StatelessWidget {
  const _TabBarWidget({
    required this.selectedTab,
    required this.onTabChanged,
  });

  final TabType selectedTab;
  final void Function(TabType) onTabChanged;

  @override
  Widget build(BuildContext context) {
    final tabs = TabType.values;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorExtension.neutral_grey_4,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: List.generate(tabs.length, (index) {
          final tab = tabs[index];
          return TabButton(
            text: tab.getName,
            index: index,
            selectedIndex: selectedTab == tab ? index : -1,
            onTap: (_) => onTabChanged(tab),
          );
        }),
      ),
    );
  }
}


final class _IngredientInstructionFieldWidget extends StatelessWidget {
  const _IngredientInstructionFieldWidget({required this.selectedTab, required this.recipe});
  final TabType selectedTab;
  final GetRecipeDetailResponseModel recipe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedTab == TabType.instructions ? 'Talimatlar' : 'İçindekiler',
            style: TextStyle(
              fontSize: 20,
              color: ColorExtension.brand_primary,
              fontWeight: FontWeight.w700,
            ),
          ),

          Text(
            selectedTab == TabType.instructions ? '${recipe.instructions.length} Adım' : '${recipe.ingredients.length} Malzeme',
            style: TextStyle(
              fontSize: 16,
              color: ColorExtension.neutral_grey_1,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(height: 12),

          ListView.separated(
            shrinkWrap: true,
            itemCount: selectedTab == TabType.instructions
                ? recipe.instructions.length
                : recipe.ingredients.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16),
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              if (selectedTab == TabType.instructions) {
                final String instruction = recipe.instructions[index];
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: selectedTab == TabType.instructions ? 20 : 30,
                    horizontal: 24,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorExtension.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorExtension.darker_blue,
                        blurRadius: 16,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _InstructionBoxWidget(instruction: instruction),
                );
              } else {
                final Ingredient ingredient = recipe.ingredients[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorExtension.white,
                    boxShadow: [
                      BoxShadow(
                        color: ColorExtension.darker_blue,
                        blurRadius: 16,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: _IngredientBoxWidget(ingredient: ingredient),
                );
              }
            },
          ),


        ],
      ),
    );
  }
}

final class _IngredientBoxWidget extends StatelessWidget {
  const _IngredientBoxWidget({required this.ingredient});
  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          ingredient.name,
          style: TextStyle(
            fontSize: 18,
            color: ColorExtension.neutral_dark,
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        Text(
          '${ingredient.amount} gr',
          style: TextStyle(
            fontSize: 16,
            color: ColorExtension.neutral_dark,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

final class _InstructionBoxWidget extends StatelessWidget {
  const _InstructionBoxWidget({required this.instruction});
  final String instruction;

  @override
  Widget build(BuildContext context) {
    return Text(
      instruction,
      style: TextStyle(
        fontSize: 16,
        color: ColorExtension.neutral_dark,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

final class _ItemInformationRowWidget extends StatelessWidget {
  const _ItemInformationRowWidget({required this.title, required this.min});
  final String title;
  final int min;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
            color: ColorExtension.neutral_dark,
            fontFamily: FontFamilyEnum.sofiaPro.value,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        Spacer(),

        Text(
          '$min Dk',
          style: TextStyle(
            color: ColorExtension.neutral_grey_1,
            fontFamily: FontFamilyEnum.sofiaPro.value,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

final class _InformationTextWidget extends StatelessWidget {
  const _InformationTextWidget({required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [

          TextSpan(
            text: description,
            style: TextStyle(
              fontSize: 16,
              color: ColorExtension.neutral_grey_1,
              fontFamily: FontFamilyEnum.sofiaPro.value,
              fontWeight: FontWeight.w400,
            ),
          ),

          TextSpan(
            text: ' Daha fazla gör',
            style: TextStyle(
              fontSize: 16,
              color: ColorExtension.brand_primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

final class _StatColumnWidget extends StatelessWidget {
  const _StatColumnWidget({
    required this.fat,
    required this.protein,
    required this.cal,
    required this.carb,
  });
  final int fat;
  final int protein;
  final int cal;
  final int carb;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.FAT, title: '${fat}g Yağ')),
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.PROTEIN, title: '${protein}g Protein')),
          ],
        ),

        SizedBox(height: 16),

        Row(
          children: [
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.CAL, title: '${cal} Kcal')),
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.CARB, title: '${carb}g KH')),
          ],
        ),
      ],
    );
  }
}

final class _ToolBarWidget extends StatelessWidget {
  const _ToolBarWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
      child: Row(
        children: [
          InkWell(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: ColorExtension.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(ImagePathEnum.X.getImagePath),
            ),
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorExtension.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(ImagePathEnum.HEART.getImagePath),
          ),
        ],
      ),
    );
  }
}

final class _ImageWidget extends StatelessWidget {
  const _ImageWidget({required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: image.isNotEmpty ? Image.network(
        image,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: ColorExtension.neutral_grey_4,
          child: const Icon(
            Icons.image_not_supported,
            size: 60,
            color: Colors.grey,
          ),
        ),
      ) : Container(
        color: ColorExtension.neutral_grey_4,
        child: const Icon(
          Icons.image_not_supported,
          size: 60,
          color: Colors.grey,
        ),
      ),
    );
  }
}