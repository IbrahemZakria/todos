import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Style/My_Theme_Data.dart';

class MyProvider extends ChangeNotifier {
  ThemeData theme = MyThemeData.Lighttheme;
  Future<void> ChangeTheme(ThemeData myTheme) async {
    theme = myTheme;
    notifyListeners();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
        'theme', theme == MyThemeData.Lighttheme ? 'light' : 'dark');
  }
}
