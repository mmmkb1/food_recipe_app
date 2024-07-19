import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/input_field.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/provider/change_notifier_provider.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:food_recipe_app/presentation/search/search_recipes_screen_view_model.dart';
import 'package:go_router/go_router.dart';

class SearchRecipesScreen extends StatelessWidget {
  const SearchRecipesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel =
        ChangeNotifierProvider.of<SearchRecipesScreenViewModel>(context).value;

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Recipes', style: TextStyles.mediumTextBold),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, size: 20.0),
          onPressed: () {
            context.pop();
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
                Expanded(
                  child: InputField(
                    hint: 'Search recipe',
                    onChanged: (value) {
                      print(value);
                      viewModel.searchRecipes(value);
                    },
                  ),
                ),
                const SizedBox(width: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    color: ColorStyles.primary100,
                    child: CustomIcons.outline(
                      'setting_2',
                      color: ColorStyles.white,
                    ),
                  ),
                ),
              ],
            ),
            Text('Recent Search', style: TextStyles.normalTextBold),
            ListenableBuilder(
              listenable: viewModel,
              builder: (BuildContext context, Widget? child) {
                if (viewModel.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (viewModel.fetchLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                final result = viewModel.recipes;
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: result.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => context.push('/recipe_details',
                            extra: result[index]),
                        child: Hero(
                          tag: 'recipe_${result[index].id}',
                          child: RecipeCard(
                            imageUrl: result[index].imageUrl,
                            title: result[index].title,
                            chef: result[index].chef,
                            rating: result[index].rating,
                            cookTime: result[index].cookTime,
                            isFavorite: result[index].isFavorite,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
