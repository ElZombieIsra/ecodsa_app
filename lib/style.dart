// Master styles for the app
import 'package:flutter/material.dart';

ThemeData appTheme = new ThemeData(
  primaryColor: primaryColor,
  accentColor: secondaryColor,
  hintColor: Colors.black45,
  fontFamily: "Mosk",
);

const Color primaryColor = Color.fromRGBO(45, 95, 175, 1.0);
const Color secondaryColor = Color.fromRGBO(190, 194, 206, 1.0);
const Color thirdColor = Color.fromRGBO(252, 252, 252, 1.0);
const Color mutedColor = Color.fromRGBO(168, 161, 171, 1);
const Color textColor = Colors.black;
const Color textColorPrimary = Colors.white;
const Color textColorSecondary = primaryColor;

TextStyle mainMutedTitle = mutedText(fontSize: 25.0);

TextStyle mutedText({
  double fontSize = 20.0,
  FontWeight weight = FontWeight.normal,
}) =>
    TextStyle(
      color: mutedColor,
      fontSize: fontSize,
      fontWeight: weight,
    );

TextStyle whiteText({
  double fontSize = 18.0,
  FontWeight weight = FontWeight.normal,
}) =>
    TextStyle(
      color: textColorPrimary,
      fontSize: fontSize,
      fontWeight: weight,
    );

TextStyle primaryText({
  double fontSize,
  FontWeight weight = FontWeight.normal,
}) =>
    TextStyle(
      color: textColorSecondary,
      fontSize: fontSize,
      fontWeight: weight,
    );

TextStyle userNameText = TextStyle(
  fontWeight: FontWeight.w600,
  fontSize: 15.0,
);

TextStyle title1 = primaryText(
  fontSize: 55.0,
  weight: FontWeight.w400,
);
