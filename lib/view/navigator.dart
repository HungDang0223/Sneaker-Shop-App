import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneaker_shop_app/controller/navigator_controller.dart';

import '../utils/constants.dart';
import 'bag/bag_screen.dart';
import 'home/home_screen.dart';
import 'profile/profile_screen.dart';

class MainNavigator extends StatefulWidget {
  @override
  _MainNavigatorState createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PageController _pageController = PageController();
  final _navController = Get.put(NavigatorController());

  List<Widget> _screen = [
    HomeScreen(),
    MyBagScreen(),
    Profile(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Scaffold(
          body: _screen[_navController.selectedIndex.value],
          bottomNavigationBar: CustomNavigationBar(
            iconSize: 27.0,
            bubbleCurve: Curves.linear,
            selectedColor: AppConstantsColor.materialButtonColor,
            strokeColor: AppConstantsColor.materialButtonColor,
            unSelectedColor: Color(0xffacacac),
            backgroundColor: Colors.white,
            scaleFactor: 0.1,
            items: [
              CustomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
              ),
              CustomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart),
              ),
              CustomNavigationBarItem(
                icon: Icon(CupertinoIcons.person),
              ),
            ],
            onTap: _navController.changeIndex,
            currentIndex: _navController.selectedIndex.value,
          ),
        )
    );
  }
}
