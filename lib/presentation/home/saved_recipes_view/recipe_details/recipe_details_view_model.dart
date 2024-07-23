import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/ingredient.dart';
import 'package:food_recipe_app/data/repository/ingredient_repository.dart';
import 'package:food_recipe_app/core/result.dart';

class RecipeDetailsViewModel with ChangeNotifier {
  final IngredientRepository _ingredientRepository;

  RecipeDetailsViewModel(this._ingredientRepository) {
    fetchIngredients();
  }

  List<Ingredient> _recipes = [];
  List<Ingredient> get recipes => List.unmodifiable(_recipes);

  final bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _fetchLoading = false;
  bool get fetchLoading => _fetchLoading;

  void fetchIngredients() async {
    _fetchLoading = true;
    notifyListeners();
    //delay
    await Future.delayed(const Duration(seconds: 1));

    final result = await _ingredientRepository.getIngredients();

    switch (result) {
      case Error<List<Ingredient>>():
        print(result.e);
        break;
      case Success<List<Ingredient>>():
        _recipes = result.data;
        break;
    }
    _fetchLoading = false;
    notifyListeners();
  }
}
