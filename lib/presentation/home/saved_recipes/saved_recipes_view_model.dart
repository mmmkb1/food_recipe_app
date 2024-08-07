import 'package:flutter/material.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes/saved_recipes_ui_state.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  SavedRecipesUiState _state = const SavedRecipesUiState();

  SavedRecipesUiState get state => _state;

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
}
