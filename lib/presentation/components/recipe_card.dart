import 'package:flutter/material.dart';
import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:food_recipe_app/ui/color_styles.dart';
import 'package:food_recipe_app/ui/text_styles.dart';
import 'package:food_recipe_app/ui/icons.dart';

@immutable
class RecipeCard extends StatefulWidget {
  Recipe recipe;
  bool isSearch;

  RecipeCard({
    super.key,
    required this.recipe,
    this.isSearch = false,
  });

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            widget.recipe.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200,
          ),
        ),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
                  widget.recipe.rating.toString(),
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
                widget.recipe.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.recipe.chef == '' ? '' : 'by ${widget.recipe.chef}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        if (widget.isSearch == false)
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                Container(
                    child: CustomIcons.outline('timer',
                        size: 17, color: ColorStyles.gray4)),
                const SizedBox(width: 8), // 4 픽셀 너비의 공간을 만듭니다.
                Text(
                  '${widget.recipe.cookTime} min',
                  style: TextStyles.smallerTextRegular
                      .copyWith(color: ColorStyles.gray4),
                ),
                const SizedBox(width: 10), // 4 픽셀 너비의 공간을 만듭니다.

                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.recipe = widget.recipe
                          .copyWith(isFavorite: !widget.recipe.isFavorite);
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
                        child: widget.recipe.isFavorite
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
