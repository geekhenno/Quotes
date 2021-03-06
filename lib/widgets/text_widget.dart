import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final TextOverflow overflow;
  final Color color;
  final FontWeight fontWeight;

  const TextWidget(
      {Key key,
      this.title,
      this.textAlign,
      this.textDirection,
      this.overflow,
      this.fontWeight,
      this.color})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .caption
          .copyWith(color: color, fontWeight: fontWeight),
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.visible,
    );
  }
}
