// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecipeImpl _$$RecipeImplFromJson(Map<String, dynamic> json) => _$RecipeImpl(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      chef: json['chef'] as String,
      rating: (json['rating'] as num).toDouble(),
      cookTime: (json['cookTime'] as num).toInt(),
      isFavorite: json['isFavorite'] as bool,
    );

Map<String, dynamic> _$$RecipeImplToJson(_$RecipeImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'chef': instance.chef,
      'rating': instance.rating,
      'cookTime': instance.cookTime,
      'isFavorite': instance.isFavorite,
    };
