import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository.dart';
import 'package:food_recipe_app/presentation/home/home_view/search/search_ui_state.dart';

class SearchRecipesScreenViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SearchRecipesScreenViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  SearchUiState _state = const SearchUiState();

  SearchUiState get state => _state;

  void fetchRecipes() async {
    _state = _state.copyWith(fetchLoading: true);
    notifyListeners();
    //delay
    await Future.delayed(const Duration(seconds: 1));

    final result = await _recipeRepository.getRecipes();

    switch (result) {
      case Error<List<Recipe>>():
        print(result.e);
        break;
      case Success<List<Recipe>>():
        _state = _state.copyWith(recipes: result.data);
        break;
    }

    _state = _state.copyWith(fetchLoading: false);
    notifyListeners();
  }

  void searchRecipes(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    if (query.isEmpty) {
      fetchRecipes();
    } else {
      _state = _state.copyWith(
          recipes: _state.recipes
              .where((recipe) =>
                  recipe.title.toLowerCase().contains(query.toLowerCase()))
              .toList());
    }

    _state = _state.copyWith(isLoading: false);
    notifyListeners();
  }
}
