import 'package:flutter/material.dart';

class MyThemeData {
  static Color PrimaryColor = Color(0xff5D9CEC);
  static Color darkaccentColor = Color(0xff141A2E);
  static Color ligtBodyColor = Color(0xffDFECDB);
  static Color darkBodyColor = Color(0xff060E1E);
  static Color greenColor = Color(0xff61E757);
  static Color redColor = Color(0xffE43737);

  static ThemeData Lighttheme = ThemeData(
    primaryColor: PrimaryColor,
    appBarTheme: AppBarTheme(
      centerTitle: false,
      iconTheme: IconThemeData(color: Colors.white),
      color: PrimaryColor,
      elevation: 0,
    ),
    textTheme: TextTheme(
        subtitle1: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22),
        headline2: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
        headline1: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)),
    scaffoldBackgroundColor: ligtBodyColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: PrimaryColor),
        unselectedItemColor: Colors.grey),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: PrimaryColor,
      elevation: 0,
    ),
  );
  static ThemeData darkTheme = ThemeData(
      primaryColor: PrimaryColor,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        color: PrimaryColor,
        elevation: 0,
      ),
      textTheme: TextTheme(
          subtitle1: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 30),
          headline2: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
          headline1: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22)),
      scaffoldBackgroundColor: Colors.transparent,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: darkaccentColor,
          selectedIconTheme: IconThemeData(color: darkBodyColor)));
}
