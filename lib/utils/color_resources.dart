// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ColorResources {
  static Color bodyBackgroundColor = Color(0xffF3F6FB);
  static Color primaryColor = Color(0xff42629E);
  static Color primarySecondaryColor = Color(0xff375385);
  static Color secondaryColor = Colors.white;
  static Color successColor = Color(0xff27AE60);
  static Color warningColor = Color(0xffE2B93B);
  static Color errorColor = Color(0xffEB5757);
  static Color violetColor = Color(0xff2D5093);
  static Color blueGreyColor = Color(0xffF6F6F6);
  static Color orangeColor = Color(0xffFFA438);
  static Color yellowColor = Color(0xffffd400);
  static Color whiteBackgroundColor = Color(0xffF8F8F8);
  static Color backgroundBannerColor = Color(0xffbfbfbf).withOpacity(0.15);
  static Color blueColor = Color(0xff2792D1);
  static Color seaColor = Color(0xff3FA2F6);
  static Color redColor = Color(0xffE63946);
  static Color lightRedColor = Color(0xffFF7061);
  static Color greyColor = Color(0xFFC7C7C7);
  static Color greyAppBarColor = Color(0xffF5F5F5);
  static Color lightGrey = Color(0xffE7E7E7);
  static Color greyBackgroundColor = Color(0xFFFFFFFF);
  static Color blackColor = Color(0xff000000);
  static Color whiteColor = Color(0xffffffff);
  static const Color transparentColor = Colors.transparent;
  static Color primaryBackground = Color(0xff42629E).withOpacity(0.1);
  static Color navigationBackground = Color(0xffF6F6F6);
  static Color navigationGreyColor = Color(0xFF6D6C6E);
  static Color iconColor = Color(0xFF374957);
  static Color textColor = Color(0xFF2B2B2B);
  static Color backgroundPrimary = Color(0xff42629E).withOpacity(0.1);
  static Color backgroundNavigation = Color(0xffF6F6F6);
  static Color navigationTextGrey = Color(0xFF6D6C6E);
  static Color iconPrimary = Color(0xFF374957);
  static Color textPrimary = Color(0xFF2B2B2B);
  static Color textLoginColor = Color(0xFF2F394E);
  static Color textSecondaryGrey = Color(0xFF5D6679);
  static Color borderGrey = Color(0xFFCBD2E0);
  static Color backgroundIcons = Color(0xFFEEEEEF);
  static Color textSecondary = Color(0xFF383E49);
  static Color nearWhiteColor = Color(0xffEBF0F0);
  static Color textCommentColor = Color(0xff63637B);

  static LinearGradient linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: const [
        Color(0xff172338),
        Color(0xff42629E),
      ]);
  static LinearGradient linearGradientPremiumButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      ColorResources.yellowColor.withOpacity(0.8),
      ColorResources.yellowColor.withOpacity(0.3),
      ColorResources.yellowColor.withOpacity(0.3),
      ColorResources.yellowColor.withOpacity(0.8),
    ],
  );
}
