import 'package:food_recipe_app/core/result.dart';
import 'package:food_recipe_app/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/mock/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/domain/model/ingredient.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';

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
