import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextStyles {
  static TextStyle _textStyle({
    required double fontSize,
    required FontWeight fontWeight,
    required double height,
  }) {
    return TextStyle(
      fontFamily: GoogleFonts.poppins().fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      height: height,
      letterSpacing: 0,
    );
  }

  static TextStyle tittleTextBold = _textStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    height: 75 / 50,
  );

  static TextStyle headerTextBold = _textStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    height: 45 / 30,
  );

  static TextStyle largeTextBold = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    height: 30 / 20,
  );

  static TextStyle mediumTextBold = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    height: 27 / 18,
  );

  static TextStyle normalTextBold = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    height: 24 / 16,
  );

  static TextStyle smallTextBold = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    height: 21 / 14,
  );

  static TextStyle smallerTextBold = _textStyle(
    fontSize: 11,
    fontWeight: FontWeight.bold,
    height: 17 / 11,
  );

  static TextStyle tittleTextRegular = _textStyle(
    fontSize: 50,
    fontWeight: FontWeight.normal,
    height: 75 / 50,
  );

  static TextStyle headerTextRegular = _textStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
    height: 45 / 30,
  );

  static TextStyle largeTextRegular = _textStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    height: 30 / 20,
  );

  static TextStyle mediumTextRegular = _textStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    height: 27 / 18,
  );

  static TextStyle normalTextRegular = _textStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 24 / 16,
  );

  static TextStyle smallTextRegular = _textStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 21 / 14,
  );

  static TextStyle smallerTextRegular = _textStyle(
    fontSize: 11,
    fontWeight: FontWeight.normal,
    height: 17 / 11,
  );
}
