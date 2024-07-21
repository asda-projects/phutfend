
import 'package:flutter/material.dart';

class LayoutConstants {
  static double smallHeightConstant = 400;
  static double mediumHeightConstant = 600;
  static double largeHeightConstant = 0; // have not set yet

  static double smallWidthConstant = 300; // have not set yet
  static double mediumWidthConstant = 500; // have not set yet
  static double largeWidthConstant = 0; // have not set yet

  // Default multipliers for different screen sizes
  static double smallHeightMultiplier = 4.0;
  static double mediumHeightMultiplier = 1.5;
  static double largeHeightMultiplier = 1.0;

  static double smallWidthMultiplier = 4.0;
  static double mediumWidthMultiplier = 1.5;
  static double largeWidthMultiplier = 1.0;

  static void updateHeightConstants({
    double? small,
    double? medium,
    double? large,
  }) {
    if (small != null) smallHeightConstant = small;
    if (medium != null) mediumHeightConstant = medium;
    if (large != null) largeHeightConstant = large;
  }

  static void updateWidthConstants({
    double? small,
    double? medium,
    double? large,
  }) {
    if (small != null) smallWidthConstant = small;
    if (medium != null) mediumWidthConstant = medium;
    if (large != null) largeWidthConstant = large;
  }

  // Methods to update the constants
  static void updateHeightMultipliers({
    double? small,
    double? medium,
    double? large,
  }) {
    if (small != null) smallHeightMultiplier = small;
    if (medium != null) mediumHeightMultiplier = medium;
    if (large != null) largeHeightMultiplier = large;
  }

  static void updateWidthMultipliers({
    double? small,
    double? medium,
    double? large,
  }) {
    if (small != null) smallWidthMultiplier = small;
    if (medium != null) mediumWidthMultiplier = medium;
    if (large != null) largeWidthMultiplier = large;
  }
}

class Layouts {

  //  AppLogger logger = AppLogger();
  // Method to adjust size based on screen height
  static double adjustHeight(BuildContext context, double value) {
    double sizeHeight = MediaQuery.of(context).size.height;


    if (sizeHeight <= LayoutConstants.smallHeightConstant) {
      return sizeHeight * LayoutConstants.smallHeightMultiplier * value;
    } else if (sizeHeight <= LayoutConstants.mediumHeightConstant) {
      return sizeHeight * LayoutConstants.mediumHeightMultiplier * value;
    } else {
      return sizeHeight * LayoutConstants.largeHeightMultiplier * value;
    }
  }

  // Method to adjust size based on screen width
  static double adjustWidth(BuildContext context, double value) {
    double sizeWidth = MediaQuery.of(context).size.width;
    if (sizeWidth <= LayoutConstants.smallWidthConstant) {
      return sizeWidth * LayoutConstants.smallWidthMultiplier * value;
    } else if (sizeWidth <= LayoutConstants.mediumWidthConstant) {
      return sizeWidth * LayoutConstants.mediumWidthMultiplier * value;
    } else {
      return sizeWidth * LayoutConstants.largeWidthMultiplier * value;
    }
  }
}
