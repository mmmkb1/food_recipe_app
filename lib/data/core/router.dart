import 'package:flutter/material.dart';
import 'package:food_recipe_app/data/model/recipe.dart';
import 'package:food_recipe_app/data/repository/recipe_repository_impl.dart';
import 'package:food_recipe_app/presentation/authentication/onboarding_screen.dart';
import 'package:food_recipe_app/presentation/authentication/sign_in_screen.dart';
import 'package:food_recipe_app/presentation/authentication/sign_up_screen.dart';
import 'package:food_recipe_app/presentation/home/home_screen.dart';
import 'package:food_recipe_app/presentation/home/recipe_details.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const OnboardingScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'sign_in',
          builder: (BuildContext context, GoRouterState state) {
            return const SignInScreen();
          },
        ),
        GoRoute(
          path: 'sign_up',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpScreen();
          },
        ),
        GoRoute(
          path: 'saved_recipes',
          builder: (BuildContext context, GoRouterState state) {
            return HomeScreen(
              recipeRepository: RecipeRepositoryImpl(),
            );
          },
        ),
        GoRoute(
          path: 'recipe_details',
          builder: (BuildContext context, GoRouterState state) {
            final recipe = state.extra as Recipe;
            return RecipeDetails(recipe: recipe);
          },
        ),
      ],
    ),
  ],
);
