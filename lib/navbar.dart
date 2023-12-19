import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:listat/controller.dart';
import 'browseList.dart';
import 'database_test.dart';

class NavBar extends StatefulWidget {
  const NavBar();

@override
State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar>{
  final controller = Get.put(NavBarController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(builder: (context){
      return Scaffold(
        body: IndexedStack(
          index: controller.tabIndex,
          children: [BrowseList(), DatabaseTest()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.tabIndex,
          onTap: controller.changeTabIndex,
          items: [
            _bottombarItem(IconlyBold.home, "Home"),
            _bottombarItem(IconlyBold.paper, "Lists"),
            _bottombarItem(IconlyBold.profile, "Profile")

          ],
        ),
        );
    });
  }
}

_bottombarItem(IconData icon, String label){
  return BottomNavigationBarItem(icon: Icon(icon),label: label);
}
