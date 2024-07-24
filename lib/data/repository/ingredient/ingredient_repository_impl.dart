import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/ingredient/ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/ingredient/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/data/model/ingredient.dart';
import 'package:food_recipe_app/data/repository/ingredient/ingredient_repository.dart';

class IngredientRepositoryImpl implements IngredientRepository {
  final IngredientDataSource _ingredientDataSource;

  IngredientRepositoryImpl({IngredientDataSource? ingredientDataSource})
      : _ingredientDataSource =
            ingredientDataSource ?? MockIngredientDataSource();

  @override
  Future<Result<List<Ingredient>>> getIngredients() async {
    try {
      return Result.success(await _ingredientDataSource.getIngredients());
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
