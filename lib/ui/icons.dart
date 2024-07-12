import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIcons {
  static const String _boldPath = 'assets/icons/bold/';
  static const String _outlinePath = 'assets/icons/outline/';

  static SvgPicture bold(String iconName,
      {double width = 20.0, double height = 20.0, Color? color}) {
    return SvgPicture.asset(
      '$_boldPath$iconName.svg',
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  static SvgPicture outline(String iconName,
      {double width = 20.0, double height = 20.0, Color? color}) {
    return SvgPicture.asset(
      '$_outlinePath$iconName.svg',
      width: width,
      height: height,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }
}
