import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/repository/recipe_repository.dart';
import 'package:food_recipe_app/presentation/authentication/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/home/home_view.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view_model.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      const HomeView(),
      const SavedRecipesView(),
      const Text('Notification Page'),
      const Text('Profile Page'),
    ];

    return Scaffold(
      body: SafeArea(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Added this line
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.bold('home',
                    size: 24, color: ColorStyles.gray4)),
            label: 'Home',
            activeIcon: Container(
                child: CustomIcons.bold('home',
                    size: 24, color: ColorStyles.primary100)),
          ),
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.outline('favorite',
                    size: 24, color: ColorStyles.gray4)),
            activeIcon: Container(
                child: CustomIcons.outline('favorite',
                    size: 24, color: ColorStyles.primary100)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.outline('notification_bing',
                    size: 24, color: ColorStyles.gray4)),
            activeIcon: Container(
                child: CustomIcons.outline('notification_bing',
                    size: 24, color: ColorStyles.primary100)),
            label: 'notification_bing',
          ),
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.outline('profile',
                    size: 24, color: ColorStyles.gray4)),
            activeIcon: Container(
                child: CustomIcons.outline('profile',
                    size: 24, color: ColorStyles.primary100)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: _onItemTapped,
        showSelectedLabels: false, // 선택된 항목의 label 숨기기
        showUnselectedLabels: false, // 선택되지 않은 항목의 label 숨기기
      ),
    );
  }
}
