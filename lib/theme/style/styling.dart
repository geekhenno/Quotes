import 'package:flutter/material.dart';
import 'package:quotes/utils/size_config.dart';

import '../colors/app_colors.dart';

class AppTheme {
  AppTheme._();
  static final TextTheme lightTextTheme = TextTheme(
    caption: _textStyle,
    subtitle1: _textStyle,
    subtitle2: _subTextStyle2,
    headline1: _headTextStyle1,
    headline2: _headTextStyle2,
    headline3: _headTextStyle3,
  );

  static final TextStyle _textStyle = TextStyle(
      fontSize: SizeConfig.textMultiplier * 1.48, color: AppColors.grey);

  static final TextStyle _subTextStyle1 = _textStyle.copyWith(
      fontSize: SizeConfig.textMultiplier * 1.0, color: AppColors.grey);
  static final TextStyle _subTextStyle2 = _textStyle.copyWith(
      fontSize: SizeConfig.textMultiplier * 1.2, color: AppColors.grey);

  static final TextStyle _headTextStyle1 = _textStyle.copyWith(
      fontSize: SizeConfig.textMultiplier * 2.6, color: AppColors.grey);
  static final TextStyle _headTextStyle2 = _textStyle.copyWith(
      fontSize: SizeConfig.textMultiplier * 2.0, color: AppColors.grey);
  static final TextStyle _headTextStyle3 = _textStyle.copyWith(
      fontSize: SizeConfig.textMultiplier * 1.8, color: AppColors.grey);
}
