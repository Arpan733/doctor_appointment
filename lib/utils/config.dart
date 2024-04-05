import 'package:flutter/material.dart';

class Config {
  static MediaQueryData? mediaQueryData;
  static double? screenWidth = 0.0;
  static double? screenHeight = 0.0;

  static void init({required BuildContext context}) {
    mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData!.size.width;
    screenHeight = mediaQueryData!.size.height;
  }

  static get widthSize {
    return screenWidth;
  }

  static get heightSize {
    return screenHeight;
  }

  static SizedBox spaceSmall = const SizedBox(
    height: 25,
  );

  static SizedBox spaceMedium = SizedBox(
    height: screenHeight! * 0.05,
  );

  static SizedBox spaceBig = SizedBox(
    height: screenHeight! * 0.08,
  );

  static OutlineInputBorder outlineBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  );

  static OutlineInputBorder focusBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.green,
    ),
  );

  static OutlineInputBorder errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  );

  static const Color primaryColor = Colors.greenAccent;
}
