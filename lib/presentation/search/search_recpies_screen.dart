import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/input_field.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SearchRecipesScreen extends StatelessWidget {
  const SearchRecipesScreen({super.key});

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Recipes', style: TextStyles.mediumTextBold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20.0),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                const PopupMenuItem(
                  child: Text('1'),
                ),
                const PopupMenuItem(
                  child: Text('2'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                const Expanded(
                  child: InputField(
                    hint: 'Search recipe',
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
            Text('Recent Search', style: TextStyles.normalTextBold),
          ],
        ),
      ),
    );
  }
}
