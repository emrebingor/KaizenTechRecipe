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
  const _CategoryFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(title: 'Kategoriler'),

        SizedBox(height: 12),

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
      ],
    );
  }
}

final class _RecipeFieldWidget extends StatelessWidget {
  const _RecipeFieldWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(title: 'Tarifler'),

        SizedBox(height: 12),

        SizedBox(
          height: 240,
          child: ListView.separated(
            itemCount: 3,
            separatorBuilder: (BuildContext context, int index) => SizedBox(width: 16),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return RecipeListBoxWidget(
                image: 'https://case-backend.vercel.app/images/karniyarik.jpg',
                title: 'Karnıyarık',
                calorie: '120 Kcal',
                time: '20 Min',
              );
            },
          ),
        ),
      ],
    );
  }
}