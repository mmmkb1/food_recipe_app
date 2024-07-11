import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/component/input_field.dart';

void main() {
  testWidgets('InputField 출력 테스트', (WidgetTester tester) async {
    // Arrange
    const label = 'Username';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InputField(label: label),
        ),
      ),
    );

    // Assert
    expect(find.text(label), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Enter $label'), findsOneWidget);
  });

  testWidgets('InputField obscureText 테스트', (WidgetTester tester) async {
    // Arrange
    const label = 'Password';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InputField(label: label, isPassword: true),
        ),
      ),
    );

    // Assert
    final textField = tester.widget<TextField>(find.byType(TextField));
    expect(textField.obscureText, isTrue);
  });
}
