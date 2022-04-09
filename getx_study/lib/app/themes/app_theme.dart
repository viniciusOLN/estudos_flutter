import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.cyan,
  buttonColor: Colors.cyan,
  brightness: Brightness.light,
  accentColor: Colors.cyan[600],
  appBarTheme: AppBarTheme(
    color: Colors.cyan,
  ),
  errorColor: Colors.red,
);

const Color SplashScreenInitialColor = Color.fromRGBO(138, 173, 243, 1);
const Color SplashScreenFinishColor = Color.fromRGBO(233, 240, 243, 1);
const Color sucessColor = Colors.green;

// HomePage - CardService colors

const Color colorTextCardCategory = Color.fromRGBO(64, 53, 53, 1);
const Color colorTextHour = Color.fromRGBO(56, 55, 55, 1);
const Color colorCostService = Color.fromRGBO(56, 55, 55, 1);
const Color colorAcronymCostService = Color.fromRGBO(3, 3, 3, 1);
const Color colorValueService = Color.fromRGBO(56, 55, 55, 1);
const Color colorCard = Color.fromRGBO(239, 239, 249, 1);

double fontSizeCardCategory = 12;
double fontSizeCardTitle = 22;
double fontSizeCardAcronymService = 20;

double fontSizeProfileFooter = 10;

class TextThemeDefault {
  static TextStyle baselineTextStyle = const TextStyle(
    fontFamily: "Inter",
  );

  static final TextStyle cardDefaultTextStyle = baselineTextStyle.copyWith(
    fontWeight: FontWeight.bold,
  );

  static final TextStyle cardTextCategory = cardDefaultTextStyle.copyWith(
    color: colorTextCardCategory,
    fontSize: fontSizeCardCategory,
  );

  static final TextStyle cardTextTitle = cardDefaultTextStyle.copyWith(
    fontSize: fontSizeCardTitle,
  );

  static final TextStyle cardTextHour = cardDefaultTextStyle.copyWith(
    color: colorTextHour,
  );

  static final TextStyle cardTextCostService = cardDefaultTextStyle.copyWith(
    color: colorCostService,
  );

  static final TextStyle cardTextAcronymService = cardDefaultTextStyle.copyWith(
    color: colorAcronymCostService,
    fontSize: fontSizeCardAcronymService,
  );

  static final TextStyle cardTextValueService = cardTextAcronymService.copyWith(
    color: colorValueService,
  );

  static final TextStyle footerTextProfile = baselineTextStyle.copyWith(
    fontSize: fontSizeProfileFooter,
  );

  static final TextStyle profileFastCardText = cardDefaultTextStyle;
}
