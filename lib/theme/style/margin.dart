import 'package:flutter/material.dart';
import 'package:quotes/utils/size_config.dart';

EdgeInsets marginSymmetric(double horizontal, double vertical) {
  return EdgeInsets.symmetric(
      horizontal: SizeConfig.heightMultiplier * horizontal,
      vertical: SizeConfig.heightMultiplier * vertical);
}
