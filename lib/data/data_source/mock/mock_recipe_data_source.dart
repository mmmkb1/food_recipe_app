import 'package:food_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';

class MockRecipeDataSource implements RecipeDataSource {
  final List<Recipe> _recipes = [
    const Recipe(
      id: 1,
      imageUrl:
          'https://cdn.pixabay.com/photo/2015/04/08/13/13/pasta-712664_1280.jpg',
      title: 'Spaghetti Carbonara',
      chef: 'Gordon Ramsay',
      rating: 4.5,
      cookTime: 30,
      category: 'Italian',
      isFavorite: true,
    ),
    const Recipe(
      id: 2,
      imageUrl:
          'https://cdn.pixabay.com/photo/2024/04/13/11/29/muffins-8693748_1280.jpg',
      title: 'Chocolate Cake',
      chef: 'Nigella Lawson',
      rating: 4.8,
      cookTime: 60,
      category: 'Asian',
      isFavorite: true,
    ),
    const Recipe(
      id: 3,
      imageUrl:
          'https://cdn.pixabay.com/photo/2019/07/25/01/23/beef-4361462_1280.jpg',
      title: 'Beef Stir Fry',
      chef: 'Bobby Flay',
      rating: 4.0,
      cookTime: 20,
      category: 'Indian',
      isFavorite: false,
    ),
    const Recipe(
      id: 4,
      imageUrl:
          'https://cdn.pixabay.com/photo/2020/10/11/05/06/chicken-5644762_1280.jpg',
      title: 'Chicken Parmesan',
      chef: 'Jamie Oliver',
      rating: 4.2,
      cookTime: 45,
      category: 'Italian',
      isFavorite: false,
    ),
    const Recipe(
      id: 5,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/11/18/17/42/barbecue-1836053_1280.jpg',
      title: 'BBQ Ribs',
      chef: 'Gordon Ramsay',
      rating: 4.7,
      cookTime: 120,
      category: 'Indian',
      isFavorite: true,
    ),
  ];

  @override
  Future<List<Recipe>> getRecipes() async {
    return _recipes;
  }
}
