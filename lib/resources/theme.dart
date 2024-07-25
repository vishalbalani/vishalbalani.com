import 'package:flutter/material.dart';
import 'package:vishalbalani/resources/colors.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: ColorManager.lightVibrantPurple,
    scaffoldBackgroundColor: ColorManager.lightBackgroundGrey,
    colorScheme: const ColorScheme.light(
      primary: ColorManager.lightVibrantPurple,
      secondary: ColorManager.lightRecruiterGreen,
      onSecondary: ColorManager.lightWhite,
      onSurface: ColorManager.lightDeepBlack,
    ),
    cardColor: ColorManager.lightCardBackgroundGrey,
    dividerColor: ColorManager.lightGreyBorder,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: ColorManager.lightMediumGreyText),
      bodyMedium: TextStyle(color: ColorManager.lightDarkGreyText),
      bodyLarge: TextStyle(color: ColorManager.lightDeepBlack),
    ),
    iconTheme: const IconThemeData(color: ColorManager.lightDimGreyText),
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: ColorManager.darkVibrantPurple,
    scaffoldBackgroundColor: ColorManager.darkBackgroundGrey,
    colorScheme: const ColorScheme.dark(
      primary: ColorManager.darkVibrantPurple,
      secondary: ColorManager.darkRecruiterGreen,
      surface: ColorManager.darkWhite,
      onPrimary: ColorManager.darkDeepBlack,
      onSecondary: ColorManager.darkDeepBlack,
      onSurface: ColorManager.darkDeepBlack,
    ),
    cardColor: ColorManager.darkCardBackgroundGrey,
    dividerColor: ColorManager.darkGreyBorder,
    textTheme: const TextTheme(
      bodySmall: TextStyle(color: ColorManager.darkMediumGreyText),
      bodyMedium: TextStyle(color: ColorManager.darkDarkGreyText),
      bodyLarge: TextStyle(color: ColorManager.darkDeepBlack),
    ),
    iconTheme: const IconThemeData(color: ColorManager.darkDimGreyText),
  );
}
