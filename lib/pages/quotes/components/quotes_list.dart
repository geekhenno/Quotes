import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/model/quotes_model.dart';
import 'package:quotes/provider/quotes_provider.dart';
import 'package:quotes/widgets/alertDialog.dart';
import 'package:quotes/widgets/title_widget.dart';

import 'quote.dart';

class QuotesList extends StatelessWidget {
  final int selectedFilter;
  final scrollController;

  QuotesList({Key key, this.selectedFilter, this.scrollController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _quotesProvider = Provider.of<QuotesProvider>(context, listen: true);
    final List<QuotesModel> _quotes = selectedFilter == 0
        ? _quotesProvider.getQuote
        : _quotesProvider.getLikedQuotes;
    return _quotes.isEmpty
        ? Center(child: TitleWidget(title: "No Quotes..."))
        : ListView.builder(
            controller: scrollController,
            shrinkWrap: true,
            itemCount: _quotes.length,
            itemBuilder: (context, index) => ElasticIn(
              child: Quote(
                  id: _quotes[index].id.toString(),
                  quote: _quotes[index].quote,
                  author: _quotes[index].author,
                  isLiked: _quotes[index].isLiked,
                  onLikePressed: () {
                    _quotesProvider.updateLikedQuote(_quotes[index].id);
                  },
                  onDeletePressed: () async {
                    if (await callDialog(
                        context: context,
                        title: "Are you sure you want to delete the quote?"))
                      _quotesProvider.deleteQuote(_quotes[index].id);
                  }),
            ),
          );
  }
}
