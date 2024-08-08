// search_recipes_use_case.dart
import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _repository;

  SearchRecipesUseCase(this._repository);

  Future<List<Recipe>> execute(String query) async {
    final result = await _repository.getRecipes();
    List<Recipe> recipes = [];

    switch (result) {
      case Error<List<Recipe>>():
        debugPrint(result.e);
        break;
      case Success<List<Recipe>>():
        if (query.isEmpty) {
          recipes = result.data;
        } else {
          recipes = result.data
              .where((recipe) =>
                  recipe.title.toLowerCase().contains(query.toLowerCase()))
              .toList();
        }
    }

    return recipes;
  }
}
