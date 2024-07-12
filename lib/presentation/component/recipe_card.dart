import 'package:flutter/material.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';

class RecipeCard extends StatefulWidget {
  String imageUrl;
  String title;
  String chef;
  double rating;
  int cookTime;
  bool isFavorite;

  RecipeCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.chef,
    required this.rating,
    required this.cookTime,
    required this.isFavorite,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network(
          widget.imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.0), // Brightest at the top
                Colors.black.withOpacity(1.0), // Darkest at the bottom
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFFAE2B8),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Icon(Icons.star, color: ColorStyles.rating),
                const SizedBox(width: 4), // 4 픽셀 너비의 공간을 만듭니다.
                Text(
                  widget.rating.toString(),
                  style: const TextStyle(),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 10,
          bottom: 10,
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                'by ${widget.chef}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Row(
            children: [
              Container(
                  child: CustomIcons.outline('timer',
                      width: 17, height: 17, color: ColorStyles.gray4)),
              const SizedBox(width: 8), // 4 픽셀 너비의 공간을 만듭니다.
              Text(
                '${widget.cookTime} min',
                style: TextStyles.smallerTextRegular
                    .copyWith(color: ColorStyles.gray4),
              ),
              const SizedBox(width: 10), // 4 픽셀 너비의 공간을 만듭니다.

              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.isFavorite = !widget.isFavorite;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: widget.isFavorite
                          ? CustomIcons.outline('favorite',
                              color: ColorStyles.primary80)
                          : CustomIcons.bold('favorite',
                              color: ColorStyles.primary80)),

                  // Icon(
                  //   widget.isFavorite ? Icons.favorite : Icons.bookmark_outline,
                  //   size: 20,
                  //   color: widget.isFavorite
                  //       ? Colors.red
                  //       : const Color(0xFF82B1A4),
                  // ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
