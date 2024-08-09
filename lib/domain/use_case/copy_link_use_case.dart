import 'package:flutter/services.dart';

class CopyLinkUseCase {
  void execute(String recipeLink) {
    Clipboard.setData(ClipboardData(text: recipeLink));
  }
}
