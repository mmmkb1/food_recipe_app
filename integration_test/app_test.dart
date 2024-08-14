import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/components/recipe_card.dart';
import 'package:food_recipe_app/presentation/home/saved_recipes/saved_recipes_view.dart';
import 'package:integration_test/integration_test.dart';
import 'package:food_recipe_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Onboarding부터 Recipe Details View까지 시나리오 테스트',
      (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Onboarding Screen
    final startCookingButton = find.text('Start Cooking');
    expect(startCookingButton, findsOneWidget);
    await tester.tap(startCookingButton);
    await tester.pumpAndSettle();

    // Sign In Screen
    final signInButton = find.text('Sign In');
    expect(signInButton, findsOneWidget);
    await tester.tap(signInButton);
    await tester.pumpAndSettle();

    // Home View
    final savedRecipesButton = find.text('Saved');
    expect(savedRecipesButton, findsOneWidget);
    await tester.tap(savedRecipesButton);
    await tester.pumpAndSettle();

    // Saved Recipes View
    final firstRecipe = find.byType(RecipeCard).first;
    expect(firstRecipe, findsOneWidget);
    await tester.tap(firstRecipe);
    await tester.pumpAndSettle();

    // Recipe Details View
    final recipeDetails = find.text('Ingredients');
    expect(recipeDetails, findsOneWidget);
  });
}
