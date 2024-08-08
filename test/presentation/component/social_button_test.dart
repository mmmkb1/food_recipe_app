import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/components/social_button.dart';

void main() {
  testWidgets('SocialButton 구글 로그인 버튼 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SocialButton(assetName: SocialButtonType.google),
    ));

    final googleIconFinder = find.byType(SvgPicture); // SvgPicture를 사용하는 경우
    expect(googleIconFinder, findsOneWidget);
    // 추가적으로 assetPath를 확인하는 방법이 필요할 수 있습니다.
  });

  testWidgets('SocialButton 페이스북 로그인 버튼 테스트', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SocialButton(assetName: SocialButtonType.facebook),
    ));

    final facebookIconFinder = find.byType(SvgPicture); // SvgPicture를 사용하는 경우
    expect(facebookIconFinder, findsOneWidget);
    // 추가적으로 assetPath를 확인하는 방법이 필요할 수 있습니다.
  });
}
