import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';

class TapBar extends StatefulWidget {
  const TapBar({super.key});

  @override
  State<TapBar> createState() => _TapBarState();
}

class _TapBarState extends State<TapBar> {
  List<bool> isPressed = [true, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BigButton(
                  label: 'Ingredient',
                  height: 40,
                  width: 170,
                  isActivated: isPressed[0],
                  onPressed: () {
                    setState(() {
                      isPressed[0] = true;
                      isPressed[1] = false;
                    });
                  },
                ),
                const SizedBox(width: 15),
                BigButton(
                  label: 'Procedure',
                  height: 40,
                  width: 170,
                  isActivated: isPressed[1],
                  onPressed: () {
                    setState(() {
                      isPressed[0] = false;
                      isPressed[1] = true;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
