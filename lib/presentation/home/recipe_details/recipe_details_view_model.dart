import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/ingredient.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/presentation/home/recipe_details/recipe_ui_state.dart';

class RecipeDetailsViewModel with ChangeNotifier {
  final IngredientRepository _ingredientRepository;
  final ProcedureRepository _procedureRepository;

  RecipeDetailsViewModel(
      this._ingredientRepository, this._procedureRepository) {
    fetchIngredients();
  }

  RecipeUiState _state = const RecipeUiState();

  RecipeUiState get state => _state;

  void fetchIngredients() async {
    _state = _state.copyWith(fetchLoading: true);
    notifyListeners();
    //delay
    await Future.delayed(const Duration(seconds: 1));

    final result = await _ingredientRepository.getIngredients();

    switch (result) {
      case Error<List<Ingredient>>():
        debugPrint(result.e);
        break;
      case Success<List<Ingredient>>():
        _state = _state.copyWith(ingredient: result.data);
        break;
    }
    _state = _state.copyWith(fetchLoading: false);
    notifyListeners();
  }

  void fetchProcedures() async {
    _state = _state.copyWith(fetchLoading: true);
    notifyListeners();
    // Assuming there's a delay or some asynchronous operation to fetch procedures.
    await Future.delayed(const Duration(seconds: 1));

    // Assuming ProcedureRepository has a getProcedures method returning a Result<List<Procedure>>.
    final result = await _procedureRepository.getProcedures();

    switch (result) {
      case Error<List<Procedure>>():
        debugPrint(result.e); // Handle error case
        break;
      case Success<List<Procedure>>():
        _state = _state.copyWith(procedure: result.data);
        break;
    }

    _state = _state.copyWith(fetchLoading: false);
    notifyListeners();
  }

  //chnage tab
  void changeTab(int index) {
    if (index == 0) {
      fetchIngredients();
    } else if (index == 1) {
      fetchProcedures();
    }

    _state = _state.copyWith(currentTab: index);
    notifyListeners();
  }
}
