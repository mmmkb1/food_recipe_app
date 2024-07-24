import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository.dart';

class SearchRecipesScreenViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesScreenViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  List<Recipe> _recipes = [];
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _fetchLoading = false;
  bool get fetchLoading => _fetchLoading;

  void fetchRecipes() async {
    _fetchLoading = true;
    notifyListeners();
    //delay
    await Future.delayed(const Duration(seconds: 1));

    final result = await _recipeRepository.getRecipes();

    switch (result) {
      case Error<List<Recipe>>():
        print(result.e);
        break;
      case Success<List<Recipe>>():
        _recipes = result.data;
        break;
    }
    _fetchLoading = false;
    notifyListeners();
  }

  void searchRecipes(String query) async {
    _fetchLoading = true;
    notifyListeners();

    if (query.isEmpty) {
      fetchRecipes();
    } else {
      _recipes = _recipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    _fetchLoading = false;
    notifyListeners();
  }
}
