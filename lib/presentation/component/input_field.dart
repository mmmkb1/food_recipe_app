import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String? label;
  final String hint;
  final bool isPassword;
  final void Function()? onChanged;

  const InputField(
      {super.key,
      this.label,
      required this.hint,
      this.isPassword = false,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Text(label!, style: TextStyles.smallTextRegular),
          const SizedBox(
            height: 5,
          ),
        ],
        TextField(
          onChanged: (value) {
            onChanged?.call();
          },
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.smallerTextRegular.copyWith(
              color: ColorStyles.gray4,
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)), // 둥근 모서리
              borderSide: BorderSide(
                color: ColorStyles.gray4,
              ), // 기본 아웃라인 색상
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12.0)), // 둥근 모서리

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
