import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/presentation/components/input_field.dart';
import 'package:food_recipe_app/presentation/components/recipe_card.dart';
import 'package:food_recipe_app/presentation/home/home_view/components/recipe_category_picker.dart';
import 'package:food_recipe_app/presentation/home/home_view/home_view_model.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  StreamSubscription<String>? _categorySubscription;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<HomeViewModel>();
    _categorySubscription =
        viewModel.categorySelectionStream.listen((category) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Selected category: $category'),
            duration: const Duration(seconds: 1),
          ),
        );
      });
    });
  }

  @override
  void dispose() {
    _categorySubscription?.cancel(); // Cancel the subscription
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();

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
            RecipeCategoryPicker(
              onSelected: (category) => viewModel.onSelectCategory(category),
            ),
            StreamBuilder<List<Recipe>>(
              initialData: viewModel.initialRecipes,
              stream: viewModel.recipesStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final recipes = snapshot.data!;
                  // print(recipes);
                  return SizedBox(
                    height:
                        200.0, // Set a specific height for the horizontal ListView
                    child: ListView.builder(
                      key: ValueKey(viewModel.categoryState),
                      scrollDirection: Axis.horizontal,
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return SizedBox(
                          width:
                              150.0, // Set a specific width for each RecipeCard
                          child: RecipeCard(recipe: recipe),
                        );
                      },
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
