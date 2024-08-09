import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/presentation/components/big_button.dart';
import 'package:food_recipe_app/presentation/components/recipe_card.dart';
import 'package:food_recipe_app/presentation/components/tap_bar.dart';
import 'package:food_recipe_app/presentation/home/recipe_details/components/ingredient_item.dart';
import 'package:food_recipe_app/presentation/home/recipe_details/components/procedure_item.dart';
import 'package:food_recipe_app/presentation/home/recipe_details/components/recipe_link_dialog.dart';
import 'package:food_recipe_app/presentation/home/recipe_details/recipe_details_view_model.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:provider/provider.dart';

class RecipeDetailsView extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsView({super.key, required this.recipe});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  StreamSubscription<bool>? _snackBarSubscription;

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<RecipeDetailsViewModel>();
    _snackBarSubscription = viewModel.snackBarStream.listen((isCopied) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).removeCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: 200,
            backgroundColor: ColorStyles.white,
            content: Text(
              isCopied ? 'Link copied!' : 'Failed to copy link',
              style: const TextStyle(color: ColorStyles.black),
            ),
            duration: const Duration(seconds: 1),
          ),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<RecipeDetailsViewModel>();
    final state = viewModel.state;

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
                PopupMenuItem(
                  child: ListTile(
                    leading: const Icon(Icons.share),
                    title: const Text('Share'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return RecipeLinkDialog(
                            recipeLink: 'https://google.com',
                            onTap: (link) {
                              Navigator.of(context).pop();
                              viewModel.copyLink(link);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.star_rate),
                    title: Text('Rate Recipe'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.comment),
                    title: Text('Review'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.bookmark_remove),
                    title: Text('Unsave'),
                  ),
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
                tag: 'recipe_${widget.recipe.id}',
                child: RecipeCard(
                  recipe: widget.recipe,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    widget.recipe.title,
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
                            widget.recipe.chef,
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
                  viewModel.changeTab(index);
                },
              ),
              Builder(
                builder: (context) {
                  if (state.isLoading || state.fetchLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  List<dynamic> result = [];
                  if (state.currentTab == 0) {
                    result = state.ingredient;
                  } else {
                    result = state.procedure;
                  }

                  return Expanded(
                    child: ListView.builder(
                      itemCount: result.length,
                      itemBuilder: (context, index) {
                        // Use IngredientItem for ingredients and ProcedureItem for procedures
                        if (state.currentTab == 0) {
                          return IngredientItem(
                              ingredient: state.ingredient[index]);
                        } else {
                          return ProcedureItem(
                              procedure: state.procedure[index]);
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
