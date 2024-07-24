import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/ingredient.dart';
import 'package:food_recipe_app/data/model/procedure.dart';
import 'package:food_recipe_app/data/repository/ingredient_repository.dart';
import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/repository/procedure_repository.dart';

class RecipeDetailsViewModel with ChangeNotifier {
  final IngredientRepository _ingredientRepository;
  final ProcedureRepository _procedureRepository;

  RecipeDetailsViewModel(
      this._ingredientRepository, this._procedureRepository) {
    fetchIngredients();
  }

  int _currentTab = 0;
  int get currentTab => _currentTab;

  List<Ingredient> _ingredient = [];
  List<Ingredient> get ingredient => List.unmodifiable(_ingredient);

  List<Procedure> _procedure = [];
  List<Procedure> get procedure => List.unmodifiable(_procedure);

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
        _ingredient = result.data;
        break;
    }
    _fetchLoading = false;
    notifyListeners();
  }

  void fetchProcedures() async {
    _fetchLoading =
        true; // Assuming _fetchLoading is used for general loading state, not just for ingredients.
    notifyListeners();
    // Assuming there's a delay or some asynchronous operation to fetch procedures.
    await Future.delayed(const Duration(seconds: 1));

    // Assuming ProcedureRepository has a getProcedures method returning a Result<List<Procedure>>.
    final result = await _procedureRepository.getProcedures();

    switch (result) {
      case Error<List<Procedure>>():
        print(result.e); // Handle error case
        break;
      case Success<List<Procedure>>():
        _procedure = result
            .data; // Assuming there's a _procedure list to hold fetched procedures.
        break;
    }
    _fetchLoading = false;
    notifyListeners();
  }

  //chnage tab
  void changeTab(int index) {
    if (index == 0) {
      fetchIngredients();
    } else if (index == 1) {
      fetchProcedures();
    }
    _currentTab = index;
    notifyListeners();
  }
}
