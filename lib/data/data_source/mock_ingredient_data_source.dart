import 'package:food_recipe_app/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/data/model/ingredient.dart';

class MockingredientDataSource implements IngredientDataSource {
  final List<Ingredient> _ingredients = [
    const Ingredient(
      name: 'Tomatos',
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/03/26/16/44/tomatoes-1280859_1280.jpg',
      weight: 100,
    ),
    const Ingredient(
      name: 'Cabbage',
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/11/21/14/44/kim-jang-5764254_1280.jpg',
      weight: 100,
    ),
    const Ingredient(
      name: 'Taco',
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/09/22/09/47/tacos-4495602_1280.jpg',
      weight: 100,
    ),
    const Ingredient(
      name: 'Slice bread',
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/06/21/15/01/bakery-5325300_1280.jpg',
      weight: 100,
    ),
  ];

  @override
  Future<List<Ingredient>> getIngredients() async {
    return _ingredients;
  }
}
