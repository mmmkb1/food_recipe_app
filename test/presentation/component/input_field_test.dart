import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/component/input_field.dart';

void main() {
  testWidgets('InputField 올바른 출력 테스트', (WidgetTester tester) async {
    // Arrange
    const label = 'Username';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InputField(label: label, hint: '',),
        ),
      ),
    );

    // Assert
    expect(find.text(label), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });

  testWidgets('InputField 값이 변경될 때 onChanged 콜백함수가 호출되는지 확인',
      (WidgetTester tester) async {
    // Arrange
    bool callbackCalled = false;
    const label = 'Username';

    // Act
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: InputField(
            label: label,
            onChanged: () {
              callbackCalled = true;
            }, hint: '',
          ),
        ),
      ),
    );

    await tester.enterText(find.byType(TextField), 'test');
    await tester.pump();

    // Assert
    expect(callbackCalled, isTrue);
  });

  testWidgets(
      'InputField isPassword가 true일 때 TextField의 obscureText가 true인지 확인',
      (WidgetTester tester) async {
    // Arrange
    const label = 'Password';

    // Act
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InputField(
            label: label,
            isPassword: true, hint: '',
          ),
        ),
      ),
    );

    // Assert
    TextField textField = tester.widget(find.byType(TextField));
    expect(textField.obscureText, isTrue);
  });
}
