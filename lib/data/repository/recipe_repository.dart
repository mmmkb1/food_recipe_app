import 'package:food_recipe_app/data/core/result.dart';
import 'package:food_recipe_app/data/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<Result<List<Recipe>>> getRecipes();
}
