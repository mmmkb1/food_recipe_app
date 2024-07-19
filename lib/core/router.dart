import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/presentation/authentication/onboarding_screen.dart';
import 'package:food_recipe_app/presentation/authentication/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/authentication/sign_up_screen.dart';
import 'package:food_recipe_app/presentation/home/home_screen.dart';
import 'package:food_recipe_app/presentation/home/recipe_details.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes_view_model.dart';
import 'package:food_recipe_app/presentation/search/search_recpies_screen.dart';
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
          path: 'saved_recipes',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final repository = RecipeRepositoryImpl();
            final viewModel = SavedRecipesViewModel(repository);
            return MaterialPage(
              child: HomeScreen(
                viewModel: viewModel,
              ),
            );
          },
        ),
        GoRoute(
          path: 'recipe_details',
          pageBuilder: (BuildContext context, GoRouterState state) {
            final recipe = state.extra as Recipe;
            return MaterialPage(child: RecipeDetails(recipe: recipe));
          },
        ),
        GoRoute(
            path: 'search',
            pageBuilder: (BuildContext context, GoRouterState state) {
              return const MaterialPage(child: SearchRecipesScreen());
            }),
      ],
    ),
  ],
);
