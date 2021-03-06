import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quotes/theme/colors/app_colors.dart';
import 'package:quotes/theme/style/margin.dart';
import 'package:quotes/widgets/title_widget.dart';

class FilteredMenu extends StatelessWidget {
  final selectedFilter;
  final onValueChanged;
  FilteredMenu({Key key, this.selectedFilter, this.onValueChanged})
      : super(key: key);
  final Map<int, Widget> filtersQuotes = {
    0: Padding(
        padding: marginSymmetric(1, 1), child: TitleWidget(title: "All")),
    1: Padding(
        padding: marginSymmetric(1, 1),
        child: TitleWidget(title: "Liked Quotes"))
  };

  @override
  Widget build(BuildContext context) {
    return CupertinoSegmentedControl(
      children: filtersQuotes,
      padding: marginSymmetric(2, 1),
      selectedColor: AppColors.grey60,
      groupValue: selectedFilter,
      onValueChanged: onValueChanged,
    );
  }
}
