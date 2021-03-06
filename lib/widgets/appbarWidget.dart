import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final appBar;
  final List<Widget> actions;
  final Widget leading;
  final titleWidget;
  final double leadingWidth;
  final Color backgroundColor;

  const AppBarWidget(
      {Key key,
      this.title,
      this.appBar,
      this.actions,
      this.leading,
      this.titleWidget,
      this.backgroundColor,
      this.leadingWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      elevation: 0,
      leadingWidth: leadingWidth ?? AppBar().leadingWidth,
      leading: leading,
      centerTitle: true,
      title: title == null
          ? titleWidget
          : Text(
              title,
              style: Theme.of(context).textTheme.headline2.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).backgroundColor),
            ),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize =>
      new Size.fromHeight(appBar ?? AppBar().preferredSize.height);
}
