import 'package:flutter/material.dart';

class SubtitleWidget extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  final TextDirection textDirection;
  final TextOverflow overflow;
  final Color color;
  final FontWeight fontWeight;

  const SubtitleWidget(
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
      style: Theme.of(context).textTheme.subtitle1.copyWith(
          color: color ?? Theme.of(context).textTheme.subtitle1.color,
          fontWeight:
              fontWeight ?? Theme.of(context).textTheme.subtitle1.fontWeight),
      textAlign: textAlign ?? TextAlign.start,
      textDirection: textDirection ?? TextDirection.ltr,
      overflow: overflow ?? TextOverflow.visible,
    );
  }
}
