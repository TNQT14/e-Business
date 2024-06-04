// ignore_for_file: long-parameter-list, deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/values/app_colors.dart';

class ThemeConfig {
  static ThemeData createTheme({
    required Brightness brightness,
    required Color background,
    required Color primaryText,
    Color? secondaryText,
    required Color accentColor,
    Color? divider,
    Color? buttonBackground,
    Color? cardBackground,
    Color? disabled,
    SystemUiOverlayStyle? systemOverlayStyle,
    Color? inputFillColor,
    Color? appBarBackground,
    Color? textColor,
  }) {
    return ThemeData(
      brightness: brightness,
      fontFamily: 'Manrope',
      canvasColor: background,
      cardColor: background,
      dividerColor: divider,
      dividerTheme: DividerThemeData(
        color: divider,
        space: 1,
        thickness: 1,
      ),
      primaryColor: accentColor,
      scaffoldBackgroundColor: background,
      appBarTheme: AppBarTheme(
        color: appBarBackground,
        iconTheme: IconThemeData(color: secondaryText),
        systemOverlayStyle: systemOverlayStyle!.copyWith(
          statusBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        centerTitle: true,
        titleSpacing: 0,
      ),
      cupertinoOverrideTheme: CupertinoThemeData(
        brightness: brightness,
        // primaryColor: accentColor,
      ),
    );
  }

  static ThemeData get lightTheme => createTheme(
        brightness: Brightness.light,
        buttonBackground: AppColors.primaryBlue500,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        primaryText: AppColors.black300,
        accentColor: AppColors.white,
        background: AppColors.white,
      );
}
