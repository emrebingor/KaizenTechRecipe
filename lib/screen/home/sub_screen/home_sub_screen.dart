part of '../home_screen.dart';

final class _HeaderFieldWidget extends StatelessWidget {
  const _HeaderFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(ImagePathEnum.sun.getImagePath),
            SizedBox(width: 4),
            Text(
              'Günaydın',
              style: TextStyle(
                color: ColorExtension.neutralDark,
                fontFamily: FontFamilyEnum.sofiaPro.value,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        Text(
          'Zeynep Yılmaz',
          style: TextStyle(
            color: ColorExtension.neutralDark,
            fontFamily: FontFamilyEnum.sofiaPro.value,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}

final class _CategoryFieldWidget extends StatelessWidget {
  const _CategoryFieldWidget({
    required this.categories,
    required this.onTap,
    required this.selectedCategory,
  });
  final List<GetCategoryResponseModel> categories;
  final GetCategoryResponseModel? selectedCategory;
  final void Function(GetCategoryResponseModel) onTap;

  @override
  Widget build(BuildContext context) {
    if(categories.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(title: 'Kategoriler'),
        SizedBox(height: 12),
        SizedBox(
          height: 41,
          child: ListView.separated(
            itemCount: categories.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 12),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final GetCategoryResponseModel category = categories[index];
              return GestureDetector(
                onTap: () => onTap(category),
                child: CategoryBoxWidget(
                  category: category,
                  selectedCategory: selectedCategory,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

final class _RecipeFieldWidget extends StatelessWidget {
  const _RecipeFieldWidget({
    required this.recipes,
    required this.onTap,
  });
  final List<GetRecipeResponseModel> recipes;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    if (recipes.isEmpty) {
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(title: 'Tarifler'),
        SizedBox(
          height: 270,
          child: ListView.separated(
            itemCount: recipes.length,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              final GetRecipeResponseModel recipe = recipes[index];
              return InkWell(
                onTap: () {
                  if(recipe.id != null) {
                    onTap(recipe.id!);
                  }
                },
                child: RecipeListBoxWidget(
                  recipe: recipe,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}