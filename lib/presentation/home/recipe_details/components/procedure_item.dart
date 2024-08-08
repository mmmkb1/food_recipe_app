import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
//textstyle
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:food_recipe_app/ui/color_styles.dart';

class ProcedureItem extends StatelessWidget {
  final Procedure procedure;

  const ProcedureItem({required this.procedure, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            procedure.step,
            style: TextStyles.smallerTextBold,
          ),
          Text(
            procedure.description,
            style: TextStyles.smallerTextRegular.copyWith(
              color: ColorStyles.gray3,
            ),
          ),
        ],
      ),
    );
  }
}
