import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe_repository.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SavedRecipesView extends StatelessWidget {
  final RecipeRepository _recipeRepository;

  const SavedRecipesView(
      {super.key, required RecipeRepository recipeRepository})
      : _recipeRepository = recipeRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              'Saved Recipes',
              style: TextStyles.mediumTextBold,
            ),
            Expanded(
              child: FutureBuilder<Result<List<Recipe>>>(
                future: _recipeRepository.getRecipes(),
                builder: (BuildContext context,
                    AsyncSnapshot<Result<List<Recipe>>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final result = snapshot.data!;
                  switch (result) {
                    case Error<List<Recipe>>():
                      return Text(result.e);
                    case Success<List<Recipe>>():
                      return ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        itemCount: result.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => context.push('/recipe_details',
                                    extra: result.data[index]),
                                child: Hero(
                                  tag: 'recipe_${result.data[index].id}',
                                  child: RecipeCard(
                                    imageUrl: result.data[index].imageUrl,
                                    title: result.data[index].title,
                                    chef: result.data[index].chef,
                                    rating: result.data[index].rating,
                                    cookTime: result.data[index].cookTime,
                                    isFavorite: result.data[index].isFavorite,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
