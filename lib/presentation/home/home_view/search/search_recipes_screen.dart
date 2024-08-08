import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/components/input_field.dart';
import 'package:food_recipe_app/presentation/components/recipe_card.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:food_recipe_app/presentation/home/home_view/search/search_recipes_screen_view_model.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchRecipesScreen extends StatelessWidget {
  const SearchRecipesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<SearchRecipesScreenViewModel>();
    final state = model.state;
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
                      debugPrint(value);
                      model.searchRecipes(value);
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
            Builder(
              builder: (context) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state.fetchLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                final result = state.recipes;
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
                            recipe: result[index],
                            isSearch: true,
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
