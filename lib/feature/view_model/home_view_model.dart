import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_crew/feature/view/app/home/notifications_screen/notifications_screen.dart';
import 'package:my_crew/feature/view/app/home/favorites_screen/favorites_screen.dart';
import 'package:my_crew/feature/view/app/home/home_screen/home_screen.dart';
import 'package:my_crew/feature/view/app/home/profile_screen/profile_screen.dart';

class HomeViewModel extends GetxController {
// Bottom navigation bar
  int bottomNavSelectedIndex = 0;

  void changeBottomNavIndex({required int index}) {
    bottomNavSelectedIndex = index;
    update();
  }

  List<Widget> screens = [
    const HomeScreen(),
    FavoritesScreen(),
    const NotificationsScreen(),
    const ProfileScreen()
  ];
}
