// lib/main_model.dart

import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  set counter(int value) {
    if (value != _counter) {
      _counter = value;
      notifyListeners();
    }
  }

  void incrementCounter() {
    _counter += 1;
    notifyListeners();
  }
}
