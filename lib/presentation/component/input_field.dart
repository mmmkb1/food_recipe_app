import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String label;
  final bool isPassword;
  const InputField({super.key, required this.label, this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.smallTextRegular),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            hintStyle: TextStyles.smallerTextRegular.copyWith(
              color: ColorStyles.gray4,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorStyles.gray4,
              ), // 기본 아웃라인 색상
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorStyles.primary80,
              ), // 포커스 시 아웃라인 색상
            ),
          ),
        ),
      ],
    );
  }
}
