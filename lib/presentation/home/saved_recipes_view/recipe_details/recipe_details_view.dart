import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';
import 'package:food_recipe_app/presentation/component/recipe_card.dart';
import 'package:food_recipe_app/presentation/component/tap_bar.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view/recipe_details/ingredient_item.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view/recipe_details/procedure_item.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view/recipe_details/recipe_details_view_model.dart';
import 'package:food_recipe_app/provider/change_notifier_provider.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:provider/provider.dart';

class RecipeDetailsView extends StatelessWidget {
  final Recipe recipe;

  const RecipeDetailsView({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<RecipeDetailsViewModel>();

    return Scaffold(
      appBar: AppBar(
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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Hero(
                tag: 'recipe_${recipe.id}',
                child: RecipeCard(
                  recipe: recipe,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    recipe.title,
                    style: TextStyles.smallTextBold,
                  ),
                  const Spacer(),
                  Text(
                    '(13k Reviews)',
                    style: TextStyles.normalTextRegular.copyWith(
                      color: ColorStyles.gray3,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                          'https://www.w3schools.com/w3images/avatar2.png',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe.chef,
                            style: TextStyles.normalTextBold,
                          ),
                          Row(
                            children: [
                              CustomIcons.bold('location',
                                  size: 17, color: ColorStyles.primary80),
                              Text(
                                'Cooking Expert',
                                style: TextStyles.smallTextRegular.copyWith(
                                  color: ColorStyles.gray3,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const BigButton(
                    label: 'Follow',
                    height: 40,
                  )
                ],
              ),
              const SizedBox(height: 8),
              TapBar(
                firstTab: 'Ingredients',
                secondTab: 'Procedures',
                onTabSelected: (index) {
                  model.changeTab(index);
                },
              ),
              Builder(
                builder: (context) {
                  if (model.isLoading || model.fetchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<dynamic> result = [];
                  if (model.currentTab == 0) {
                    result = model.ingredient;
                  } else {
                    result = model.procedure;
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        // Use IngredientItem for ingredients and ProcedureItem for procedures
                        if (model.currentTab == 0) {
                          return IngredientItem(
                              ingredient: model.ingredient[index]);
                        } else {
                          return ProcedureItem(
                              procedure: model.procedure[index]);
                        }
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
