part of '../item_detail_screen.dart';

final class _TabBarWidget extends StatefulWidget {
  const _TabBarWidget();

  @override
  State<_TabBarWidget> createState() => __TabBarWidgetState();
}

final class __TabBarWidgetState extends State<_TabBarWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: ColorExtension.neutral_grey_4,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          TabButton(
            text: "İçindekiler",
            index: 0,
            selectedIndex: selectedIndex,
            onTap: (i) => setState(() => selectedIndex = i),
          ),
          TabButton(
            text: "Talimatlar",
            index: 1,
            selectedIndex: selectedIndex,
            onTap: (i) => setState(() => selectedIndex = i),
          ),
        ],
      ),
    );
  }
}

final class _IngredientInstructionFieldWidget extends StatelessWidget {
  const _IngredientInstructionFieldWidget();

  @override
  Widget build(BuildContext context) {
    return                 Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'İçindekiler',
          style: TextStyle(
            fontSize: 20,
            color: ColorExtension.brand_primary,
            fontWeight: FontWeight.w700,
          ),
        ),

        Text(
          '3 Malzeme',
          style: TextStyle(
            fontSize: 16,
            color: ColorExtension.neutral_grey_1,
            fontWeight: FontWeight.w400,
          ),
        ),

        SizedBox(height: 12),

        ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          separatorBuilder: (BuildContext context, int index) => SizedBox(height: 16),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
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
              child: Row(
                children: [
                  Text(
                    'Kuzu Eti',
                    style: TextStyle(
                      fontSize: 18,
                      color: ColorExtension.neutral_dark,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Kuzu Eti',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorExtension.neutral_dark,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          },
        ),

      ],
    );
  }
}

final class _ItemInformationRowWidget extends StatelessWidget {
  const _ItemInformationRowWidget();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'İskender Kebap',
          style: TextStyle(
            color: ColorExtension.neutral_dark,
            fontFamily: FontFamilyEnum.sofiaPro.value,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        Spacer(),

        Text(
          '15 Dk',
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
  const _InformationTextWidget();

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 16),
        children: [

          TextSpan(
            text: 'Döner et, pide, domates sosu ve yoğurt ile ',
            style: TextStyle(
              fontSize: 16,
              color: ColorExtension.neutral_grey_1,
              fontFamily: FontFamilyEnum.sofiaPro.value,
              fontWeight: FontWeight.w400,
            ),
          ),

          TextSpan(
            text: 'Daha fazla gör',
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
  const _StatColumnWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.FAT, title: '91g Yağ')),
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.PROTEIN, title: '27g Protein')),
          ],
        ),

        SizedBox(height: 16),

        Row(
          children: [
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.CAL, title: '120 Kcal')),
            Expanded(child: IngredientBoxWidget(icon: ImagePathEnum.CARB, title: '65g KH')),
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
  const _ImageWidget();

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://case-backend.vercel.app/images/karniyarik.jpg',
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}