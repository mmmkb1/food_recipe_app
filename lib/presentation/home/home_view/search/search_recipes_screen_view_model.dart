import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:food_recipe_app/presentation/home/home_view/search/search_ui_state.dart';

class SearchRecipesScreenViewModel with ChangeNotifier {
  final GetRecipesUseCase _getRecipesUseCase;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchRecipesScreenViewModel(
      this._getRecipesUseCase, this._searchRecipesUseCase) {
    fetchRecipes();
  }

  SearchUiState _state = const SearchUiState();

  SearchUiState get state => _state;

  void fetchRecipes() async {
    _state = _state.copyWith(fetchLoading: true);
    notifyListeners();
    //delay
    await Future.delayed(const Duration(seconds: 1));

    final result = await _getRecipesUseCase.execute();

    _state = _state.copyWith(recipes: result, fetchLoading: false);
    notifyListeners();
  }

  void searchRecipes(String query) async {
    _state = _state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _searchRecipesUseCase.execute(query);
    _state = _state.copyWith(recipes: result, isLoading: false);
    notifyListeners();
  }
}
