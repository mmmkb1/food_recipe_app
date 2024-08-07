import 'package:food_recipe_app/domain/model/ingredient.dart';
import 'package:food_recipe_app/domain/model/procedure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_ui_state.freezed.dart';

@freezed
class RecipeUiState with _$RecipeUiState {
  const factory RecipeUiState({
    @Default(0) int currentTab,
    @Default([]) List<Ingredient> ingredient,
    @Default([]) List<Procedure> procedure,
    @Default(false) bool isLoading,
    @Default(false) bool fetchLoading,
  }) = _RecipeUiState;
}
