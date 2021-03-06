import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:quotes/utils/size_config.dart';

import 'text_widget.dart';

enum FlushBarStatus {
  SUCCESSFUL,
  FAILED,
}
Future flushBar(
    {@required String message,
    Color textColor,
    Color backGroundColor,
    FlushBarStatus status,
    FlushbarPosition position,
    FlushbarStyle style,
    @required context}) async {
  return Flushbar(
    flushbarPosition: position ?? FlushbarPosition.TOP,
    // title: "",
    flushbarStyle: style ??
        (Platform.isIOS ? FlushbarStyle.GROUNDED : FlushbarStyle.FLOATING),
    borderRadius: 15,
    borderColor: status == null
        ? Theme.of(context).primaryColor
        : status == FlushBarStatus.SUCCESSFUL
            ? Theme.of(context).primaryColor
            : Theme.of(context).errorColor,
    borderWidth: SizeConfig.heightMultiplier * 0.2,
    messageText: TextWidget(
      title: message ?? "",
      color: textColor ?? Theme.of(context).backgroundColor,
    ),
    duration: Duration(milliseconds: 2500),

    isDismissible: true,

    backgroundColor: status == null
        ? Theme.of(context).primaryColor
        : status == FlushBarStatus.SUCCESSFUL
            ? Theme.of(context).primaryColor
            : Theme.of(context).errorColor,
  )..show(context);
}

// showToast({String message, ToastGravity gravity}) {
//   return Fluttertoast.showToast(
//       msg: message,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: gravity ?? ToastGravity.BOTTOM,
//       backgroundColor: LightColors.kGrey,
//       textColor: LightColors.white,
//       fontSize: SizeConfig.heightMultiplier * 1.5);
//   //  await flushBar(message: "معلومات البطاقة غير صحيحة", context: context);
// }
