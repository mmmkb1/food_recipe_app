import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/core/result.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  String categoryState = 'All';
  final _selectedCategoryController = StreamController<String>.broadcast();
  final _recipesController = StreamController<List<Recipe>>.broadcast();

  HomeViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  Stream<String> get categorySelectionStream =>
      _selectedCategoryController.stream;

  Stream<List<Recipe>> get recipesStream => _recipesController.stream;

  void onSelectCategory(String category) {
    categoryState = category;
    _selectedCategoryController.add(category);
    if (category == 'All') {
      fetchRecipes();
    } else {
      getRecipesByCategory(category);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _selectedCategoryController.close();
    _recipesController.close();
  }

  void fetchRecipes() async {
    final result = await _recipeRepository.getRecipes();

    switch (result) {
      case Error<List<Recipe>>():
        debugPrint(result.e);
        _recipesController.add([]);
        break;
      case Success<List<Recipe>>():
        final recipes = result.data;
        _recipesController.add(recipes);
        break;
    }
  }

  void getRecipesByCategory(String category) async {
    final result = await _recipeRepository.getRecipesByCategory(category);

    switch (result) {
      case Error<List<Recipe>>():
        debugPrint(result.e);
        _recipesController.add([]);
        break;
      case Success<List<Recipe>>():
        final recipes = result.data;
        _recipesController.add(recipes);
        // print(recipes);
        break;
    }
  }
}
