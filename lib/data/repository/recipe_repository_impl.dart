import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  RecipeRepositoryImpl({RecipeDataSource? recipeDataSource})
      : _recipeDataSource = recipeDataSource ?? MockRecipeDataSource();

  @override
  Future<Result<List<Recipe>>> getRecipes() async {
    try {
      return Result.success(await _recipeDataSource.getRecipes());
      // return Success(await _recipeDataSource.getRecipes());
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
