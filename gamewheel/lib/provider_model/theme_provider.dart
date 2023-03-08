import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _mode;

  bool isVI = true;
  String get viLocale => isVI ? "vi" : "en";
  Locale get locale => isVI ? const Locale("vi") : const Locale("en");
  ThemeMode get mode => _mode;
  ThemeProvider({
    ThemeMode mode = ThemeMode.light,
  }) : _mode = mode;

  void toggleMode({bool? light}) {
    if (light != null) {
      _mode = light ? ThemeMode.light : ThemeMode.dark;
    }
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void chanceLocale({bool isEN = false}) {
    // if (isEN != Null) {
    //   isVI = isEN??true;
    // } else {
    //   isVI = !isVI;
    // }
    isVI = isEN;
    print("222222${isVI}");

    notifyListeners();
  }
}
