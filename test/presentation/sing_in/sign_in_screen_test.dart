import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/components/big_button.dart';
import 'package:food_recipe_app/presentation/components/social_button.dart';
import 'package:food_recipe_app/presentation/authentication/sign_in_screen.dart';

void main() {
  testWidgets('SignInScreen 컴포넌트 테스트', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MaterialApp(
        home: SignInScreen(),
      ),
    );

    // Verify that the SignInScreen contains the expected texts.
    expect(find.text('Hello,'), findsOneWidget);
    expect(find.text('Welcome Back!'), findsOneWidget);
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Password'), findsOneWidget);
    expect(find.text('Forgot Password?'), findsOneWidget);
    expect(find.text('Sign In'), findsOneWidget);
    expect(find.text('Or Sign in With'), findsOneWidget);
    expect(find.text('Don’t have an account?'), findsOneWidget);
    expect(find.text('Sign Up'), findsOneWidget);

    // Verify that the SignInScreen contains the expected buttons.
    expect(find.byType(BigButton), findsOneWidget);
    expect(find.byType(SocialButton), findsNWidgets(2));
  });
}
