import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class SavedRecipesView extends StatelessWidget {
  SavedRecipesView({super.key});
  List<RecipeCard> recipes = [
    RecipeCard(
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/08/13/13/pasta-712664_1280.jpg',
      title: 'Spaghetti Carbonara',
      chef: 'Gordon Ramsay',
      rating: 4.5,
      cookTime: 30,
      isFavorite: true,
    ),
    RecipeCard(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/10/11/05/06/chicken-5644762_1280.jpg',
      title: 'Chicken Parmesan',
      chef: 'Jamie Oliver',
      rating: 4.2,
      cookTime: 45,
      isFavorite: false,
    ),
    RecipeCard(
      imageUrl:
          'https://cdn.pixabay.com/photo/2024/04/13/11/29/muffins-8693748_1280.jpg',
      title: 'Chocolate Cake',
      chef: 'Nigella Lawson',
      rating: 4.8,
      cookTime: 60,
      isFavorite: true,
    ),
    RecipeCard(
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/07/25/01/23/beef-4361462_1280.jpg',
      title: 'Beef Stir Fry',
      chef: 'Bobby Flay',
      rating: 4.0,
      cookTime: 20,
      isFavorite: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'Saved Recipes',
            style: TextStyles.mediumTextBold,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    recipes[index],
                    const SizedBox(height: 10),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
