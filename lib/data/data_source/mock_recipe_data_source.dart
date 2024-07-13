import 'package:food_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/data/model/recipe.dart';

class MockRecipeDataSource implements RecipeDataSource {
  final List<Recipe> _recipes = [
    const Recipe(
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/08/13/13/pasta-712664_1280.jpg',
      title: 'Spaghetti Carbonara',
      chef: 'Gordon Ramsay',
      rating: 4.5,
      cookTime: 30,
      isFavorite: true,
    ),
    const Recipe(
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/10/11/05/06/chicken-5644762_1280.jpg',
      title: 'Chicken Parmesan',
      chef: 'Jamie Oliver',
      rating: 4.2,
      cookTime: 45,
      isFavorite: false,
    ),
    const Recipe(
      imageUrl:
          'https://cdn.pixabay.com/photo/2024/04/13/11/29/muffins-8693748_1280.jpg',
      title: 'Chocolate Cake',
      chef: 'Nigella Lawson',
      rating: 4.8,
      cookTime: 60,
      isFavorite: true,
    ),
    const Recipe(
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/07/25/01/23/beef-4361462_1280.jpg',
      title: 'Beef Stir Fry',
      chef: 'Bobby Flay',
      rating: 4.0,
      cookTime: 20,
      isFavorite: false,
    ),
  ];

  @override
  Future<List<Recipe>> getRecipes() async {
    return _recipes;
  }
}
