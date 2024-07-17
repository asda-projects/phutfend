import 'package:flutter/material.dart';

// ignore: slash_for_doc_comments
/** 
----- Color Scheme Colors ----- 

primary: The primary color of the application.
secondary: The secondary color of the application.
surface: The background color for components like cards.
error: The color to use for error indications.
onPrimary: The color to use for text/icons on primary color.
onSecondary: The color to use for text/icons on secondary color.
onSurface: The color to use for text/icons on surface color.
onBackground: The color to use for text/icons on background color.
onError: The color to use for text/icons on error color.

-----  Text Theme Colors ----- 

bodyLarge: The default text color for large body text.
bodyMedium: The default text color for medium body text.
bodySmall: The default text color for small body text.
displayLarge: The default text color for large display text.
displayMedium: The default text color for medium display text.
displaySmall: The default text color for small display text.
headlineLarge: The default text color for large headline text.
headlineMedium: The default text color for medium headline text.
headlineSmall: The default text color for small headline text.
titleLarge: The default text color for large title text.
titleMedium: The default text color for medium title text.
titleSmall: The default text color for small title text.
labelLarge: The default text color for large labels.
labelMedium: The default text color for medium labels.
labelSmall: The default text color for small labels.
*/

class AppColors {
  // Light Theme Colors
  static const Color lightPrimaryColor = Color.fromARGB(198, 0, 0, 0);
  static const Color lightSecondaryColor = Colors.white;
  static const Color lightAccentColor1 = Colors.yellow;
  static const Color lightAccentColor2 = Color.fromARGB(255, 62, 213, 135);
  static const Color lightNeutralColor = Colors.grey;
  // Dark Theme Colors
  static const Color darkPrimaryColor = Colors.white;
  static const Color darkSecondaryColor = Color.fromARGB(198, 0, 0, 0);
  static const Color darkAccentColor1 = Colors.yellow;
  static const Color darkAccentColor2 = Color.fromARGB(255, 62, 213, 135);
  static const Color darkNeutralColor = Colors.grey;
}

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.lightPrimaryColor,
  scaffoldBackgroundColor: AppColors.lightSecondaryColor,
  colorScheme: const ColorScheme.light(
    primary: AppColors.lightPrimaryColor,
    secondary: AppColors.lightAccentColor1,
    tertiary: AppColors.darkAccentColor2,
    surface: AppColors.lightSecondaryColor,
    onPrimary: AppColors.lightSecondaryColor,
    onSecondary: AppColors.lightPrimaryColor,
    onTertiary: AppColors.darkSecondaryColor,
    onSurface: AppColors.lightNeutralColor,
    onError: Colors.red,
    error: Colors.red,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.lightSecondaryColor,
    iconTheme: IconThemeData(color: AppColors.lightPrimaryColor),
    titleTextStyle: TextStyle(color: AppColors.lightPrimaryColor, fontSize: 20),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.lightPrimaryColor),
    bodyMedium: TextStyle(color: AppColors.lightPrimaryColor),
    bodySmall: TextStyle(color: AppColors.lightPrimaryColor),
    displayLarge: TextStyle(color: AppColors.lightPrimaryColor),
    displayMedium: TextStyle(color: AppColors.lightPrimaryColor),
    displaySmall: TextStyle(color: AppColors.lightPrimaryColor),
    headlineLarge: TextStyle(color: AppColors.lightPrimaryColor),
    headlineMedium: TextStyle(color: AppColors.lightPrimaryColor),
    headlineSmall: TextStyle(color: AppColors.lightPrimaryColor),
    titleLarge: TextStyle(color: AppColors.lightPrimaryColor),
    titleMedium: TextStyle(color: AppColors.lightPrimaryColor),
    titleSmall: TextStyle(color: AppColors.lightPrimaryColor),
    labelLarge: TextStyle(color: AppColors.lightPrimaryColor),
    labelMedium: TextStyle(color: AppColors.lightPrimaryColor),
    labelSmall: TextStyle(color: AppColors.lightPrimaryColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.lightAccentColor1),
      foregroundColor: WidgetStateProperty.all(AppColors.lightPrimaryColor),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: AppColors.darkPrimaryColor,
  scaffoldBackgroundColor: AppColors.darkSecondaryColor,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.darkPrimaryColor,
    secondary: AppColors.darkAccentColor2,
    tertiary: AppColors.darkAccentColor1,
    surface: AppColors.darkSecondaryColor,
    onPrimary: AppColors.darkSecondaryColor,
    onSecondary: AppColors.darkPrimaryColor,
    onTertiary: AppColors.darkSecondaryColor,
    onSurface: AppColors.lightNeutralColor,
    onError: Colors.red,
    error: Colors.red,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkSecondaryColor,
    iconTheme: IconThemeData(color: AppColors.darkPrimaryColor),
    titleTextStyle: TextStyle(color: AppColors.darkPrimaryColor, fontSize: 20),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: AppColors.darkPrimaryColor),
    bodyMedium: TextStyle(color: AppColors.darkPrimaryColor),
    bodySmall: TextStyle(color: AppColors.darkPrimaryColor),
    displayLarge: TextStyle(color: AppColors.darkPrimaryColor),
    displayMedium: TextStyle(color: AppColors.darkPrimaryColor),
    displaySmall: TextStyle(color: AppColors.darkPrimaryColor),
    headlineLarge: TextStyle(color: AppColors.darkPrimaryColor),
    headlineMedium: TextStyle(color: AppColors.darkPrimaryColor),
    headlineSmall: TextStyle(color: AppColors.darkPrimaryColor),
    titleLarge: TextStyle(color: AppColors.darkPrimaryColor),
    titleMedium: TextStyle(color: AppColors.darkPrimaryColor),
    titleSmall: TextStyle(color: AppColors.darkPrimaryColor),
    labelLarge: TextStyle(color: AppColors.darkPrimaryColor),
    labelMedium: TextStyle(color: AppColors.darkPrimaryColor),
    labelSmall: TextStyle(color: AppColors.darkPrimaryColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.darkAccentColor2),
      foregroundColor: WidgetStateProperty.all(AppColors.darkPrimaryColor),
    ),
  ),
);
