import 'package:flutter/material.dart';

class ColorManager {
  ColorManager._();

  // Light theme colors
  static const Color lightWhite = Color(0xFFFFFFFF);
  static const Color lightDeepBlack = Color(0xFF323235);
  static const Color lightDarkGreyText = Color(0xFF5e5e63);
  static const Color lightMediumGreyText = Color(0xFF75757a);
  static const Color lightGreyBorder = Color(0xFFe6ebef);
  static const Color lightBackgroundGrey = Color(0xFFf4f6f8);
  static const Color lightDimGreyText = Color(0xFF707072);
  static const Color lightCardBackgroundGrey = Color(0xFFeceff1);
  static const Color lightAccentGrey = Color(0xFFbdbdc5);
  static const Color lightRecruiterGreen = Color(0xFF277e69);
  static const Color lightSoftCoral = Color(0xFFff7171);
  static const Color lightVibrantPurple = Color(0xFF8075ff);

  // Dark theme colors
  static const Color darkWhite = Color(0xFF1E1E1E);
  static const Color darkDeepBlack = Color(0xFFE6E6E6);
  static const Color darkDarkGreyText = Color(0xFFA1A1A6);
  static const Color darkMediumGreyText = Color(0xFFB8B8BD);
  static const Color darkGreyBorder = Color(0xFF3A3A3E);
  static const Color darkBackgroundGrey = Color(0xFF2C2C2E);
  static const Color darkDimGreyText = Color(0xFFB0B0B2);
  static const Color darkCardBackgroundGrey = Color(0xFF3A3A3C);
  static const Color darkAccentGrey = Color(0xFF6E6E76);
  static const Color darkRecruiterGreen = Color(0xFF2A9D8F);
  static const Color darkSoftCoral = Color(0xFFFF8C8C);
  static const Color darkVibrantPurple = Color(0xFF9D96FF);

  static Color getShade(Color color, {bool darker = false, double value = .1}) {
    assert(value >= 0 && value <= 1, 'shade values must be between 0 and 1');

    final hsl = HSLColor.fromColor(color);
    final hslDark = hsl.withLightness(
      (darker ? (hsl.lightness - value) : (hsl.lightness + value))
          .clamp(0.0, 1.0),
    );

    return hslDark.toColor();
  }
}

extension SuiizColors on Color {
  /// Returns a [MaterialColor] from a [Color] object
  MaterialColor getMaterialColorFromColor() {
    final colorShades = <int, Color>{
      50: ColorManager.getShade(this, value: 0.5),
      100: ColorManager.getShade(this, value: 0.4),
      200: ColorManager.getShade(this, value: 0.3),
      300: ColorManager.getShade(this, value: 0.2),
      400: ColorManager.getShade(this),
      500: this, //Primary value
      600: ColorManager.getShade(this, darker: true),
      700: ColorManager.getShade(this, value: 0.15, darker: true),
      800: ColorManager.getShade(this, value: 0.2, darker: true),
      900: ColorManager.getShade(this, value: 0.25, darker: true),
    };
    return MaterialColor(value, colorShades);
  }
}
