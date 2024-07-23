import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';

class BigButton extends StatefulWidget {
  final String label;
  final double height;
  final double width;
  final bool hasArrow;
  final bool isActivated;
  final void Function()? onPressed;

  const BigButton({
    super.key,
    required this.label,
    this.height = 60,
    this.width = double.infinity,
    this.hasArrow = false,
    this.isActivated = true,
    this.onPressed,
  });

  @override
  State<BigButton> createState() => _BigButtonState();
}

class _BigButtonState extends State<BigButton> {
  // bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.onPressed?.call();
        // setState(() {
        //   isPressed = !isPressed;
        // });
      },
      style: ElevatedButton.styleFrom(
        fixedSize: Size(widget.width, widget.height),
        // padding: const EdgeInsets.symmetric(vertical: 18),
        backgroundColor:
            widget.isActivated ? ColorStyles.primary100 : ColorStyles.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.label,
              style: TextStyles.normalTextBold.copyWith(
                color: widget.isActivated
                    ? ColorStyles.white
                    : ColorStyles.primary100,
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
