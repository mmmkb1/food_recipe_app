import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SocialButtonType { google, facebook, apple }

class SocialButton extends StatelessWidget {
  final SocialButtonType assetName;

  const SocialButton({super.key, required this.assetName});

  @override
  Widget build(BuildContext context) {
    String assetPath;

    switch (assetName) {
      case SocialButtonType.google:
        assetPath = 'assets/icons/social/google.svg';
        break;
      case SocialButtonType.facebook:
        assetPath = 'assets/icons/social/facebook.svg';
        break;
      case SocialButtonType.apple:
        assetPath = 'assets/icons/social/apple.svg';
        break;
    }

    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: SvgPicture.asset(assetPath),
    );
  }
}
