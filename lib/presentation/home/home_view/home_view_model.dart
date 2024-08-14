import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/core/result.dart';

class HomeViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;
  String _categoryState = 'All';

  final StreamController<String> _selectedCategoryController;
  final StreamController<List<Recipe>> _recipesController;
  List<Recipe> _initialRecipes = [];

  HomeViewModel(this._recipeRepository)
      : _selectedCategoryController = StreamController<String>.broadcast(),
        _recipesController = StreamController<List<Recipe>>.broadcast() {
    _fetchRecipes();
  }

  String get categoryState => _categoryState;

  Stream<String> get categorySelectionStream =>
      _selectedCategoryController.stream;
  Stream<List<Recipe>> get recipesStream => _recipesController.stream;

  List<Recipe> get initialRecipes => _initialRecipes;

  void onSelectCategory(String category) {
    _categoryState = category;
    _selectedCategoryController.add(category);
    if (category == 'All') {
      _fetchRecipes();
    } else {
      _fetchRecipesByCategory(category);
    }
  }

  @override
  void dispose() {
    _selectedCategoryController.close();
    _recipesController.close();
    super.dispose();
  }

  void _fetchRecipes() async {
    final result = await _recipeRepository.getRecipes();
    _handleRecipeResult(result);
  }

  void _fetchRecipesByCategory(String category) async {
    final result = await _recipeRepository.getRecipesByCategory(category);
    _handleRecipeResult(result);
  }

  void _handleRecipeResult(Result<List<Recipe>> result) {
    switch (result) {
      case Error<List<Recipe>>():
        debugPrint(result.e);
        _recipesController.add([]);
        break;
      case Success<List<Recipe>>():
        final recipes = result.data;
        if (_categoryState == 'All') {
          _initialRecipes = recipes;
        }
        _recipesController.add(recipes);
        break;
    }
  }
}
