import 'dart:async';

import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  final _categorySelectionController = StreamController<String>();

  Stream<String> get categorySelectionStream =>
      _categorySelectionController.stream;

  void onSelectCategory(String category) {
    _categorySelectionController.add(category);
    print(category);
  }

  @override
  void dispose() {
    _categorySelectionController.close();
    super.dispose();
  }
}
