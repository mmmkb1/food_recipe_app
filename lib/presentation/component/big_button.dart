import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final String label;
  final double height;
  final bool hasArrow;
  final void Function()? onPressed;

  const BigButton({
    super.key,
    required this.label,
    this.height = 60,
    this.hasArrow = false,
    this.onPressed,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed?.call();
        setState(() {
          isPressed = !isPressed;
        });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, widget.height),
        // padding: const EdgeInsets.symmetric(vertical: 18),
        backgroundColor: ColorStyles.primary100,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.label,
              style: TextStyles.normalTextBold.copyWith(
                color: isPressed ? Colors.red : ColorStyles.white,
              )),
          widget.hasArrow
              ? const Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: ColorStyles.white,
                      size: 20,
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
