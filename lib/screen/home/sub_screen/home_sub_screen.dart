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
            SvgPicture.asset(ImagePathEnum.SUN.getImagePath),

            SizedBox(width: 4),

            Text(
              'Günaydın',
              style: TextStyle(
                color: ColorExtension.neutral_dark,
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
            color: ColorExtension.neutral_dark,
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
  const _CategoryFieldWidget(this.categories);
  final List<GetCategoryResponseModel> categories;

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
              return CategoryBoxWidget(
                title: category.name ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}

final class _RecipeFieldWidget extends StatelessWidget {
  const _RecipeFieldWidget({required this.recipes, required this.onTap});
  final List<GetRecipeResponseModel> recipes;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    if(recipes.isEmpty) return SizedBox.shrink();
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
                  image: recipe.image ?? '',
                  title: recipe.name ?? '',
                  calorie: '${recipe.calories} Kcal',
                  time: '${recipe.cookTime} Min',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}