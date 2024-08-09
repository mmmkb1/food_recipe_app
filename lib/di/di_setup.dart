import 'package:food_recipe_app/data/data_source/ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/mock/mock_ingredient_data_source.dart';
import 'package:food_recipe_app/data/data_source/mock/mock_procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/mock/mock_recipe_data_source.dart';
import 'package:food_recipe_app/data/data_source/procedure_data_source.dart';
import 'package:food_recipe_app/data/data_source/recipe_data_source.dart';
import 'package:food_recipe_app/data/repository/ingredient_repository_impl.dart';
import 'package:food_recipe_app/data/repository/procedure_repository_impl.dart';
import 'package:food_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/domain/repository/ingredient_repository.dart';
import 'package:food_recipe_app/domain/repository/procedure_repository.dart';
import 'package:food_recipe_app/domain/repository/recipe_repository.dart';
import 'package:food_recipe_app/domain/use_case/get_recipes_use_case.dart';
import 'package:food_recipe_app/domain/use_case/search_recipes_use_case.dart';
import 'package:food_recipe_app/presentation/home/home_view/home_view_model.dart';
import 'package:food_recipe_app/presentation/home/home_view/search/search_recipes_screen_view_model.dart';
import 'package:food_recipe_app/presentation/home/recipe_details/recipe_details_view_model.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes/saved_recipes_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  getIt.registerSingleton<RecipeDataSource>(MockRecipeDataSource());
  getIt.registerSingleton<RecipeRepository>(
      RecipeRepositoryImpl(recipeDataSource: getIt()));
  getIt.registerFactory(() => SavedRecipesViewModel(getIt()));

  getIt.registerSingleton<IngredientDataSource>(MockIngredientDataSource());
  getIt.registerSingleton<IngredientRepository>(
      IngredientRepositoryImpl(ingredientDataSource: getIt()));
  getIt.registerSingleton<ProcedureDataSource>(MockProcedureDataSource());
  getIt.registerSingleton<ProcedureRepository>(
      ProcedureRepositoryImpl(procedureDataSource: getIt()));
  getIt.registerFactory<RecipeDetailsViewModel>(() => RecipeDetailsViewModel(
        getIt(),
        getIt(),
      ));

  getIt.registerSingleton<GetRecipesUseCase>(GetRecipesUseCase(getIt()));
  getIt.registerSingleton<SearchRecipesUseCase>(SearchRecipesUseCase(getIt()));
  getIt.registerFactory<SearchRecipesScreenViewModel>(
      () => SearchRecipesScreenViewModel(
            getIt(),
            getIt(),
          ));

  getIt.registerFactory<HomeViewModel>(() => HomeViewModel(getIt()));
}
