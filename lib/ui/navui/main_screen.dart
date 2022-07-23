import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/constants/colors.dart';
import 'package:travelapp/constants/dimens.dart';
import 'package:travelapp/ui/navui/bar_item_screen.dart';
import 'package:travelapp/ui/home_screen.dart';
import 'package:travelapp/ui/navui/profile_screen.dart';
import 'package:travelapp/ui/navui/search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List screens = [
    HomeScreen(),
    BarItemScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      // Get.to(screens[index]);   GET ile sayfa geçişi
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavbarItem(icon: Icons.apps_outlined, text: "Home"),
            BottomNavbarItem(icon: Icons.bar_chart_outlined, text: "Statistic"),
            BottomNavbarItem(icon: Icons.search, text: "Search"),
            BottomNavbarItem(icon: Icons.person, text: "Profile"),
          ]),
    );
  }

  BottomNavigationBarItem BottomNavbarItem(
          {required String text, required IconData icon}) =>
      BottomNavigationBarItem(
        label: text,
        icon: Icon(
          icon,
        ),
      );
}
