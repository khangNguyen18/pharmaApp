import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.teal,
);

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = FlexThemeData.light(
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    swapLegacyOnMaterial3: false,
    useMaterial3: true,
    scheme: FlexScheme.tealM3,
    surfaceTint: Colors.transparent,
    textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 16,
          ),
        ),
    dialogBackground: const Color.fromARGB(255, 174, 174, 174),
    secondary: kColorScheme.error,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
  );

  static ThemeData darkTheme = FlexThemeData.dark(
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    swapLegacyOnMaterial3: false,
    useMaterial3: true,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    dialogBackground: Colors.grey.shade800,
    secondary: const Color.fromARGB(255, 15, 15, 15),
    scheme: FlexScheme.indigo,
    surfaceTint: Colors.transparent,
    tabBarStyle: FlexTabBarStyle.forBackground,
  );
}
