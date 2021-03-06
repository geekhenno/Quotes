import 'package:flutter/material.dart';
import 'package:quotes/theme/style/margin.dart';
import 'package:quotes/widgets/raised_button.dart';

import 'title_widget.dart';

callDialog(
    {@required context,
    String title,
    String confirmedTitle = "Confirm",
    String canceledTitle = "Cancel"}) async {
  var returnValue;
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        TitleWidget(
          title: title,
        ),
      ]),
      backgroundColor: Theme.of(context).backgroundColor,
      actionsPadding: marginSymmetric(1, 1),
      elevation: 2,
      actions: [
        RaisedButtonWidget(
            title: canceledTitle,
            onPressed: () {
              Navigator.pop(context);
              returnValue = false;
            }),
        RaisedButtonWidget(
            backgroundColor: Theme.of(context).errorColor,
            title: confirmedTitle,
            onPressed: () {
              Navigator.pop(context);
              returnValue = true;
            }),
      ],
    ),
  );
  return returnValue;
}
