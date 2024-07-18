import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/onboarding_background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.4),
                  Colors.black.withOpacity(1),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/food_recipe_icon.png',
                          color: ColorStyles.white,
                        ),
                        const SizedBox(
                          height: 14,
                        ),
                        Text(
                          '100K+ Premium Recipe ',
                          style: TextStyles.mediumTextBold.copyWith(
                            color: ColorStyles.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 280,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          'Get\nCooking',
                          textAlign: TextAlign.center,
                          style: TextStyles.tittleTextBold.copyWith(
                            color: ColorStyles.white,
                            height: 1.1,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Simple way to find Tasty Recipe',
                          style: TextStyles.normalTextRegular.copyWith(
                            color: ColorStyles.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  SizedBox(
                    width: 243,
                    child: Hero(
                      tag: 'button',
                      child: BigButton(
                        label: 'Start Cooking',
                        onPressed: () {
                          context.go('/sign_in');
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
