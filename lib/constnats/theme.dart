import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  iconTheme: const IconThemeData(color: blackColor, opacity: 0.8),
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: whiteColor,
  appBarTheme: const AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey,
      statusBarIconBrightness: Brightness.dark,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: redColor,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: redColor,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
    backgroundColor: Colors.white,
  ),
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: TextStyle(
        fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.black),
    headline3: TextStyle(fontSize: 18.0, color: Colors.black),
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: Colors.grey.shade900,
  primaryColor: Colors.black,
  textTheme: const TextTheme(
    headline1: TextStyle(
        fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: TextStyle(
        fontSize: 16.0, fontStyle: FontStyle.italic, color: Colors.white),
    headline3: TextStyle(fontSize: 18.0, color: Colors.white),
    bodyText1: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  colorScheme: const ColorScheme.dark(),
  iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  // scaffoldBackgroundColor: HexColor('333739'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.grey.shade900, //HexColor('333739'),
    elevation: 0.0,
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    unselectedItemColor: Colors.grey,
    elevation: 20.0,
  ),
  // textTheme: TextTheme(
  //   bodyText1: TextStyle(
  //     fontSize: 18.0,
  //     fontWeight: FontWeight.w600,
  //     color: Colors.white,
  //   ),
  // ),
);
const blueColor = Color(0xFF4e5ae8);
const orangeColor = Colors.deepOrange;
const yellowColor = Colors.yellow;
const pinkColor = Colors.pink;
const whiteColor = Colors.white;
const blackColor = Colors.black;
const greyColor = Color(0xFFD6D6D6);
const lightGreyColor = Color(0xFFF5F5F5);
const darkGreyColor = Color(0xFF121212);
//const Color primaryColor = pinkColor;
//const Color primaryColor = Color(0xFFFF9781);
const greenColor = Colors.green;
const redColor = Colors.redAccent;
const appColorPrimary = Color(0xFF0A79DF);
const appColorPrimaryDark = Color(0xFF0A79DF);
const appColorAccent = Color(0xFF03DAC5);
const appTextColorPrimary = Color(0xFF212121);
const iconColorPrimary = Color(0xFFFFFFFF);
const appTextColorSecondary = Color(0xFF5A5C5E);
const iconColorSecondary = Color(0xFFA8ABAD);
const appLayoutBackground = Color(0xFFf8f8f8);
const appWhite = Color(0xFFFFFFFF);
const purpleLightColor = Color(0xFFdee1ff);
const orangeLightColor = Color(0xFFffddd5);
const greenLight = Color(0xFFb4ef93);
const cherryColor = Color(0xFFffddd5);
const skyBlueColor = Color(0xFF73d8d4);
const mustardYellowColor = Color(0xFFffc980);
const darkPurpleLightColor = Color(0xFF8998ff);
const darkPurpleColor = Color(0xFF515BBE);
const appIconTintDarkCherry = Color(0xFFf2866c);
const appIconTintDarkSkyBlue = Color(0xFF73d8d4);
const darkGreenColor = Color(0xFF5BC136);
const darkRedColor = Color(0xFFF06263);
const appLightRed = Color(0xFFF89B9D);
const appCat1 = Color(0xFF8998FE);
const appCat2 = Color(0xFFFF9781);
const appCat3 = Color(0xFF73D7D3);
const appCat4 = Color(0xFF87CEFA);
const appCat5 = appColorPrimary;
const appShadowColor = Color(0x95E9EBF0);
const appColorPrimaryLight = Color(0xFFF9FAFF);
const appSecondaryBackgroundColor = Color(0xFF131d25);
const appDividerColor = Color(0xFFDADADA);
