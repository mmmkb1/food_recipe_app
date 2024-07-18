import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe_repository.dart';

import '../core/result.dart';

class SavedRecipesViewModel with ChangeNotifier {
  final RecipeRepository _recipeRepository;

  SavedRecipesViewModel(this._recipeRepository) {
    fetchRecipes();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  //접근한 RecipeRepository가 Result 패턴으로 되어있어서
  //success, error 처리를 fetchRecipes 내에서 해주어야 함
  List<Recipe> _recipes = [];

  //리스트 접근 못하는 unmodifiable
  List<Recipe> get recipes => List.unmodifiable(_recipes);

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<void> fetchRecipes() async {
    _isLoading = true;
    final data = await _recipeRepository.getRecipes();
    notifyListeners();

    _isLoading = false;
    switch (data) {
      case Success<List<Recipe>>():
        _recipes = data.data;

      case Error<List<Recipe>>():
        _errorMessage = 'Error';
        notifyListeners();
    }
  }
}
// _isloading = true;
// notifyListeners();
//
// _recipes = await _recipeRepository.getRecipes();
// _isloading = false;
// notifyListeners();
