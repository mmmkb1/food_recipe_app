import 'package:flutter/material.dart';
import 'package:food_recipe_app/presentation/component/big_button.dart';

class TapBar extends StatefulWidget {
  // final void Function() onPressed; // 1. 콜백 함수 타입 정의
  final viewModel;

  const TapBar({
    super.key,
    this.viewModel,
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
                  label: 'Ingredient',
                  height: 40,
                  width: 170,
                  isActivated: isPressed[0],
                  onPressed: () {
                    widget.viewModel.changeTab(0); // 3. 콜백 함수 호출
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
                    widget.viewModel.changeTab(1); // 3. 콜백 함수 호출
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
