import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/components/big_button.dart';

class TapBar extends StatefulWidget {
  String firstTab;
  String secondTab;
  final Function(int) onTabSelected; // 1. Define a callback function type

  TapBar({
    super.key,
    required this.firstTab,
    required this.secondTab,
    required this.onTabSelected, // 2. Add the callback function to the constructor
  }); // 2. 생성자에 콜백 함수 추가

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
                  label: widget.firstTab,
                  height: 40,
                  width: 170,
                  isActivated: isPressed[0],
                  onPressed: () {
                    widget.onTabSelected(0);
                    setState(() {
                      isPressed[0] = true;
                      isPressed[1] = false;
                    });
                  },
                ),
                const SizedBox(width: 15),
                BigButton(
                  label: widget.secondTab,
                  height: 40,
                  width: 170,
                  isActivated: isPressed[1],
                  onPressed: () {
                    widget.onTabSelected(1);
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
