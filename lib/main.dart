import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/router.dart';
import 'package:food_recipe_app/di/di_setup.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

void main() {
  diSetup('prod');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: ColorStyles.white, // 배경화면을 흰색으로 설정
      ),
      routerConfig: router,
    );
  }
}
