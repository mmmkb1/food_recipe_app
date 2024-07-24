import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/ingredient/ingredient_repository_impl.dart';
import 'package:food_recipe_app/data/repository/procedure/procedure_repository_impl.dart';
import 'package:food_recipe_app/data/repository/recipe/recipe_repository_impl.dart';
import 'package:food_recipe_app/presentation/authentication/onboarding_screen.dart';
import 'package:food_recipe_app/presentation/authentication/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/authentication/sign_up_screen.dart';
import 'package:food_recipe_app/presentation/home/home_screen.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view/recipe_details/recipe_details_view.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view/recipe_details/recipe_details_view_model.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view/saved_recipes_view_model.dart';
import 'package:food_recipe_app/presentation/home/home_view/search/search_recipes_screen.dart';
import 'package:food_recipe_app/presentation/home/home_view/search/search_recipes_screen_view_model.dart';
import 'package:food_recipe_app/provider/change_notifier_provider.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      pageBuilder: (BuildContext context, GoRouterState state) {
        return const MaterialPage(child: OnboardingScreen());
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'sign_in',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: SignInScreen());
          },
        ),
        GoRoute(
          path: 'sign_up',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return const MaterialPage(child: SignUpScreen());
          },
        ),
        GoRoute(
          path: 'home',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage(
              child: ChangeNotifierProvider<SavedRecipesViewModel>(
                value: SavedRecipesViewModel(RecipeRepositoryImpl()),
                child: const HomeScreen(),
              ),
            );
          },
        ),
        GoRoute(
          path: 'recipe_details',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final recipe = state.extra as Recipe;
            return MaterialPage(
                child: ChangeNotifierProvider<RecipeDetailsViewModel>(
                    value: RecipeDetailsViewModel(
                        IngredientRepositoryImpl(), ProcedureRepositoryImpl()),
                    child: RecipeDetailsView(recipe: recipe)));
          },
        ),
        GoRoute(
            path: 'search',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return MaterialPage(
                child: ChangeNotifierProvider<SearchRecipesScreenViewModel>(
                  value: SearchRecipesScreenViewModel(RecipeRepositoryImpl()),
                  child: const SearchRecipesScreen(),
                ),
              );
            }),
      ],
    ),
  ],
);
