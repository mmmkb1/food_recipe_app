import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'saved_recipes_ui_state.freezed.dart';

@freezed
class SavedRecipesUiState with _$SavedRecipesUiState {
  const factory SavedRecipesUiState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default(false) bool fetchLoading,
  }) = _SavedRecipesUiState;
}
