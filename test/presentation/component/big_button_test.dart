import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/components/big_button.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

void main() {
  testWidgets('BigButton 눌렀을 때 색상 변경 테스트', (WidgetTester tester) async {
    // Build the BigButton widget.
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: BigButton(label: 'Press Me'),
        ),
      ),
    );

    // Verify the initial state of the button.
    expect(find.text('Press Me'), findsOneWidget);
    expect(
      (tester
          .widget<ElevatedButton>(find.byType(ElevatedButton))
          .style
          ?.backgroundColor
          ?.resolve({})),
      ColorStyles.primary100,
    );

    // Tap the button and trigger a frame.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify the state of the button after the tap.
    expect(
      (tester.widget<Text>(find.text('Press Me')).style?.color),
      Colors.red,
    );
  });
}
