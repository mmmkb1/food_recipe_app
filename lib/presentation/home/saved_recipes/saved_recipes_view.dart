import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes/saved_recipes_view_model.dart';
import 'package:food_recipe_app/provider/change_notifier_provider.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SavedRecipesView extends StatelessWidget {
  const SavedRecipesView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SavedRecipesViewModel>();
    final state = viewModel.state;
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
              child: state.isLoading || state.fetchLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      itemCount: state.recipes.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(height: 10),
                            GestureDetector(
                              onTap: () => context.push('/recipe_details',
                                  extra: state.recipes[index]),
                              child: Hero(
                                tag: 'recipe_${state.recipes[index].id}',
                                child: RecipeCard(
                                  recipe: state.recipes[index],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
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
