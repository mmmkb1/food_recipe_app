import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe_repository.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view_model.dart';
import 'package:food_recipe_app/provider/change_notifier_provider.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';

class SavedRecipesView extends StatelessWidget {
  const SavedRecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel =
        ChangeNotifierProvider.of<SavedRecipesViewModel>(context).value;

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
              child: ListenableBuilder(
                listenable: viewModel,
                builder: (BuildContext context, Widget? child) {
                  if (viewModel.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (viewModel.fetchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final result = viewModel.recipes;
                  return ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () => context.push('/recipe_details',
                                extra: result[index]),
                            child: Hero(
                              tag: 'recipe_${result[index].id}',
                              child: RecipeCard(
                                recipe: result[index],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
