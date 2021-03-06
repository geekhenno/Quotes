import 'package:flutter/material.dart';

import 'size_config.dart';

class Animations {
  static void animateToIndex(double i, controller) => controller.animateTo(
      (SizeConfig.isMobilePortrait
              ? SizeConfig.heightMultiplier * 3.8
              : SizeConfig.isPortrait
                  ? SizeConfig.heightMultiplier * 2.5
                  : SizeConfig.heightMultiplier * 6) *
          i,
      duration: Duration(milliseconds: 1200),
      curve: Curves.ease);
}
