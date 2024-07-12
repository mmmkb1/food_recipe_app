import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/saved_recipes/saved_recipes_view.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;

  static final List<Widget> _widgetOptions = <Widget>[
    const Text('Home Page'),
    SavedRecipesView(),
    const Text('Notification Page'),
    const Text('Profile Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Added this line
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.bold('home',
                    width: 24, height: 24, color: ColorStyles.gray4)),
            label: 'Home',
            activeIcon: Container(
                child: CustomIcons.bold('home',
                    width: 24, height: 24, color: ColorStyles.primary100)),
          ),
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.outline('favorite',
                    width: 24, height: 24, color: ColorStyles.gray4)),
            activeIcon: Container(
                child: CustomIcons.outline('favorite',
                    width: 24, height: 24, color: ColorStyles.primary100)),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.outline('notification_bing',
                    width: 24, height: 24, color: ColorStyles.gray4)),
            activeIcon: Container(
                child: CustomIcons.outline('notification_bing',
                    width: 24, height: 24, color: ColorStyles.primary100)),
            label: 'notification_bing',
          ),
          BottomNavigationBarItem(
            icon: Container(
                child: CustomIcons.outline('profile',
                    width: 24, height: 24, color: ColorStyles.gray4)),
            activeIcon: Container(
                child: CustomIcons.outline('profile',
                    width: 24, height: 24, color: ColorStyles.primary100)),
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
