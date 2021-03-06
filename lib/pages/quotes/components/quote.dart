import 'package:flutter/material.dart';
import 'package:quotes/theme/colors/app_colors.dart';
import 'package:quotes/theme/style/margin.dart';
import 'package:quotes/widgets/text_widget.dart';
import 'package:quotes/widgets/title_widget.dart';

class Quote extends StatelessWidget {
  final String id;
  final String author;
  final String quote;
  final bool isLiked;
  final onLikePressed;
  final onDeletePressed;

  const Quote(
      {Key key,
      this.id,
      this.author,
      this.quote,
      this.isLiked,
      this.onLikePressed,
      this.onDeletePressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: marginSymmetric(1, 1),
      child: Card(
        child: Container(
          margin: marginSymmetric(1, 1),
          child: ListTile(
            leading: TextWidget(title: id),
            subtitle: Row(
              children: [
                TitleWidget(title: author),
                Spacer(),
                IconButton(
                  icon: isLiked
                      ? Icon(
                          Icons.favorite,
                          color: AppColors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                        ),
                  onPressed: onLikePressed,
                ),
                IconButton(
                  icon: Icon(Icons.close_rounded),
                  onPressed: onDeletePressed,
                ),
              ],
            ),
            title: Container(
                child: TextWidget(
              title: quote,
            )),
          ),
        ),
      ),
    );
  }
}
