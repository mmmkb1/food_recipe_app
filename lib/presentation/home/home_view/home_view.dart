import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_recipe_app/presentation/components/input_field.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Scaffold(
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello Jega', style: TextStyles.largeTextBold),
                    Text(
                      'What are you cooking today?',
                      style: TextStyles.normalTextRegular.copyWith(
                        color: ColorStyles.gray3,
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                      10.0), // Adjust the radius as needed
                  child: Image.network(
                    'https://www.w3schools.com/w3images/avatar2.png',
                    width: 50, // Adjust the width as needed
                    height: 50, // Adjust the height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    hint: 'Search recipe',
                    onTap: () {
                      context.push('/search');
                    },
                  ),
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: ColorStyles
                        .primary100, // Set the background color to black
                    child: CustomIcons.outline(
                      'setting_2',
                      color: ColorStyles.white, // Adjust the color as needed
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
