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

  void _handleButtonPress(String label) {
    setState(() {
      _isActivated.updateAll((key, value) => key == label);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        children: <Widget>[
          BigButton(
            label: 'All',
            isActivated: _isActivated['All']!,
            onPressed: () => {
              _handleButtonPress('All'),
              widget.onSelected!('All'),
            },
          ),
          BigButton(
              label: 'Indian',
              isActivated: _isActivated['Indian']!,
              onPressed: () => {
                    _handleButtonPress('Indian'),
                    widget.onSelected!('Indian'),
                  }),
          BigButton(
              label: 'Italian',
              isActivated: _isActivated['Italian']!,
              onPressed: () => {
                    _handleButtonPress('Italian'),
                    widget.onSelected!('Italian'),
                  }),
          BigButton(
              label: 'Asian',
              isActivated: _isActivated['Asian']!,
              onPressed: () => {
                    _handleButtonPress('Asian'),
                    widget.onSelected!('Asian'),
                  }),
          BigButton(
              label: 'Chinese',
              isActivated: _isActivated['Chinese']!,
              onPressed: () => {
                    _handleButtonPress('Chinese'),
                    widget.onSelected!('Chinese'),
                  }),
        ],
      ),
    );
  }
}
