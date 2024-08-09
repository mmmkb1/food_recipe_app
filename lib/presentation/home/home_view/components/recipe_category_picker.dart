import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/components/big_button.dart';

class RecipeCategoryPicker extends StatefulWidget {
  final void Function(String)? onSelected;
  const RecipeCategoryPicker({super.key, this.onSelected});

  @override
  State<RecipeCategoryPicker> createState() => _RecipeCategoryPickerState();
}

class _RecipeCategoryPickerState extends State<RecipeCategoryPicker> {
  final Map<String, bool> _isActivated = {
    'All': true,
    'Indian': false,
    'Italian': false,
    'Asian': false,
    'Chinese': false,
  };

  final List<String> _categories = [
    'All',
    'Indian',
    'Italian',
    'Asian',
    'Chinese'
  ];

  void _handleButtonPress(String label) {
    setState(() {
      _isActivated.updateAll((key, value) => key == label);
    });
    widget.onSelected!(label);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: _categories.map((category) {
          return BigButton(
            label: category,
            isActivated: _isActivated[category]!,
            onPressed: () => _handleButtonPress(category),
          );
        }).toList(),
      ),
    );
  }
}
