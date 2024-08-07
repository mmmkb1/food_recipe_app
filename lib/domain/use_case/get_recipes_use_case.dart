import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class GetRecipesUseCase {
  final RecipeRepository _recipeRepository;

  GetRecipesUseCase(this._recipeRepository);

  Future<List<Recipe>> execute() async {
    final result = await _recipeRepository.getRecipes();
    List<Recipe> recipes = [];

    switch (result) {
      case Error<List<Recipe>>():
        print(result.e);
        break;
      case Success<List<Recipe>>():
        recipes = result.data;
    }
    return recipes;
  }
}
