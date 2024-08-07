import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/ingredient.dart';

class IngredientItem extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientItem({required this.ingredient, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          SizedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                ingredient.imageUrl,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 20.0), // 왼쪽 여백 설정
            child: Text(
              ingredient.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Spacer(),
          Text(
            '${ingredient.weight}g',
            style: const TextStyle(
              fontSize: 24,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
