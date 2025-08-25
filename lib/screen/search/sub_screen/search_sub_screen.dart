part of '../search_screen.dart';

final class _TextFieldWidget extends StatelessWidget {
  const _TextFieldWidget({required this.controller, this.onChanged});
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFieldWidget(
      controller: controller,
      hintText: 'Arama',
      onChanged: onChanged,
    );
  }
}

final class _CategoryFieldWidget extends StatelessWidget {
  const _CategoryFieldWidget({required this.selectedCategory, required this.onTap});
  final GetCategoryResponseModel? selectedCategory;
  final void Function(GetCategoryResponseModel) onTap;

  @override
  Widget build(BuildContext context) {
    final categories = context.watch<RecipeProvider>().categoryList;
    if(categories.isEmpty) return SizedBox.shrink();
    return SizedBox(
      height: 41,
      child: ListView.separated(
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) => SizedBox(width: 12),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final GetCategoryResponseModel category = categories[index];
          return InkWell(
            onTap: () => onTap(category),
            child: CategoryBoxWidget(
              category: category,
              selectedCategory: selectedCategory,
            ),
          );
        },
      ),
    );
  }
}

final class _EmptyRecipeWidget extends StatelessWidget {
  const _EmptyRecipeWidget();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.restaurant_menu,
            size: 64,
            color: ColorExtension.brandPrimary,
          ),

          const SizedBox(height: 16),

          Text(
            'Kategoriye ait ürün şu an güncel ürün yoktur.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
              fontFamily: FontFamilyEnum.sofiaPro.value,
              color: ColorExtension.brandPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

final class _RecipeListWidget extends StatelessWidget {
  const _RecipeListWidget({this.filteredRecipe, required this.onTap});
  final List<GetRecipeResponseModel>? filteredRecipe;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: filteredRecipe?.length ?? 0,
      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16),
      scrollDirection: Axis.vertical,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        final GetRecipeResponseModel? recipe = filteredRecipe?[index];
        return InkWell(
          onTap: () => onTap(recipe?.id ?? 0),
          child: VerticalItemBoxWidget(
            recipe: recipe,
          ),
        );
      },
    );
  }
}