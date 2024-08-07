import 'package:food_recipe_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_ui_state.freezed.dart';

@freezed
class SearchUiState with _$SearchUiState {
  const factory SearchUiState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default(false) bool fetchLoading,
  }) = _SearchUiState;
}
