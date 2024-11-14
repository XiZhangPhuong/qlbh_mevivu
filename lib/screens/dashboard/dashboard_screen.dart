import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:project_qlbh/screens/cart/cart_screen.dart';

import 'package:project_qlbh/screens/dashboard/dashboard_controller.dart';
import 'package:project_qlbh/screens/home/home_screen.dart';
import 'package:project_qlbh/screens/post/post_screen.dart';
import 'package:project_qlbh/screens/profile/profile_screen.dart';

class DashBoardScreen extends StatelessWidget {
  final DashBoardController dashBoardController =
      Get.put(DashBoardController());

  final List<Widget> pages = [
    HomeScreenPage(),
    PostScreen(),
    CartScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return pages[dashBoardController.selectedIndex.value];
        },
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
              currentIndex: dashBoardController.selectedIndex.value,
              onTap: (value) {
                dashBoardController.changeTabIndex(value);
              },
              selectedItemColor: Colors.blue,
              // unselectedItemColor: Colors.blue,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.article),
                  label: 'Post',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label: 'Cart',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ]);
        },
      ),
    );
  }
}
