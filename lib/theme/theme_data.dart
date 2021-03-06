import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/utils/size_config.dart';

import 'colors/app_colors.dart';
import 'style/styling.dart';

ThemeData themeData() {
  return ThemeData(
    fontFamily: "Din",
    backgroundColor: AppColors.beige,
    primaryColor: AppColors.grey,
    scaffoldBackgroundColor: AppColors.beige,
    textTheme: AppTheme.lightTextTheme,
    accentColor: AppColors.grey,
    cursorColor: AppColors.grey,
    cupertinoOverrideTheme: CupertinoThemeData(
      primaryColor: AppColors.grey,
    ),
    cardTheme: CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.grey60,
    ),
    errorColor: AppColors.red,
    buttonColor: AppColors.grey,
    buttonTheme: ButtonThemeData(
      buttonColor: AppColors.grey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),

    inputDecorationTheme: InputDecorationTheme(
      labelStyle: AppTheme.lightTextTheme.caption,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AppColors.grey70)),
    ),
    iconTheme: IconThemeData(
        color: AppColors.grey, size: SizeConfig.imageSizeMultiplier * 7),
    // ),
  );
}
