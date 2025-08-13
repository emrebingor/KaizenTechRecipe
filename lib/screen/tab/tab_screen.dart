import 'package:flutter_svg/flutter_svg.dart';
import 'package:kaizen_tech_recipe/components/tab_bar/bottom_navigation_tab_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:kaizen_tech_recipe/data/provider/tab_provider.dart';
import 'package:kaizen_tech_recipe/enum/image_path_enum.dart';
import 'package:kaizen_tech_recipe/screen/home/home_screen.dart';
import 'package:kaizen_tech_recipe/utils/extension/color_extension.dart';
import 'package:kaizen_tech_recipe/utils/extension/image_path_extension.dart';
import 'package:provider/provider.dart';

final class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

final class _TabScreenState extends State<TabScreen> {

  final List<Widget> pages = const [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final tabProvider = context.watch<TabProvider>();

    return Scaffold(
      body: pages[tabProvider.selectedIndex],
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: ColorExtension.darker_green,
        onPressed: () {},
        child: SvgPicture.asset(
          ImagePathEnum.CHEF.getImagePath,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomNavigationTabBarWidget(),
    );
  }
}