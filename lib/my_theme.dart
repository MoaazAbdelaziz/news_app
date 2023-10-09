import 'package:flutter/material.dart';

class MyTheme {
  static Color primayLightColor = const Color(0xFF39A552);
  static Color whiteColor = const Color(0xFFFFFFFF);
  static Color redColor = const Color(0xFFC91C22);
  static Color darkBlueColor = const Color(0xFF003E90);
  static Color pinkColor = const Color(0xFFED1E79);
  static Color brownColor = const Color(0xFFCf7E48);
  static Color blueColor = const Color(0xFF4882CF);
  static Color yellowColor = const Color(0xFFF2D352);
  static Color greyColor = const Color(0xFF4F5A69);
  static Color blackColor = const Color(0xFF303030);

  static ThemeData lightTheme = ThemeData(
    primaryColor: primayLightColor,
    appBarTheme: AppBarTheme(
      backgroundColor: primayLightColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: whiteColor,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    ),
  );
}
