import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quotes/theme/colors/app_colors.dart';
import 'package:quotes/utils/size_config.dart';

callProgressDialog(context) {
  showDialog(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    barrierColor: Colors.black12,
    builder: (context) => AlertDialog(
      title: Center(
          child: SpinKitCircle(
        size: SizeConfig.imageSizeMultiplier * 9,
        itemBuilder: (BuildContext context, int index) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
          );
        },
      )),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
  );
}

Widget loadingDialog() {
  return Center(
      child: SpinKitCircle(
    size: SizeConfig.imageSizeMultiplier * 9,
    color: AppColors.grey,
  ));
}
