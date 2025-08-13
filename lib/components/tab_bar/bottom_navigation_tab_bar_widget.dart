import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/data/provider/tab_provider.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

final class BottomNavigationTabBarWidget extends StatelessWidget {

  const BottomNavigationTabBarWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<TabProvider>();

    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorExtension.grey_shadow,
            blurRadius: 40,
            offset: const Offset(0, -10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        child: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 8.0,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _NavItem(
                icon: tabProvider.selectedIndex == 0 ? ImagePathEnum.SELECTED_HOME : ImagePathEnum.HOME,
                index: 0,
              ),
              _NavItem(
                icon: tabProvider.selectedIndex == 1 ? ImagePathEnum.SELECTED_SEARCH : ImagePathEnum.SEARCH,
                index: 1,
              ),
              const SizedBox(width: 48),
              _NavItem(
                icon: ImagePathEnum.ALERT,
                index: 2,
              ),
              _NavItem(
                icon: ImagePathEnum.PROFILE,
                index: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final class _NavItem extends StatelessWidget {
  final ImagePathEnum icon;
  final int index;

  const _NavItem({
    required this.icon,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        icon.getImagePath,
      ),
      onPressed: () {
        if(index == 0 || index == 1) {
          context.read<TabProvider>().setTab(index);
        }
      },
    );
  }
}