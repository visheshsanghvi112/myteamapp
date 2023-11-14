import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = ThemeData.light();
  static const String _themeKey = 'theme';

  ThemeProvider() {
    _loadTheme();
  }

  ThemeData get themeData => _themeData;

  void toggleTheme() {
    _themeData = (_themeData == ThemeData.light()) ? ThemeData.dark() : ThemeData.light();
    _saveTheme();
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool isDarkMode = prefs.getBool(_themeKey) ?? false;

    _themeData = isDarkMode ? ThemeData.dark() : ThemeData.light();
    notifyListeners();
  }

  Future<void> _saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(_themeKey, _themeData == ThemeData.dark());
  }
}
