import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quotes/pages/quotes/components/filtered_meun.dart';
import 'package:quotes/provider/quotes_provider.dart';
import 'package:quotes/services/api/quotes_api.dart';
import 'package:quotes/theme/style/margin.dart';
import 'package:quotes/utils/listAnimation.dart';
import 'package:quotes/utils/size_config.dart';
import 'package:quotes/widgets/dialogs.dart';
import 'package:quotes/widgets/flushbar.dart';
import 'package:quotes/widgets/raised_button.dart';

import 'components/quotes_list.dart';

class Quotes extends StatefulWidget {
  @override
  _QuotesState createState() => _QuotesState();
}

class _QuotesState extends State<Quotes> {
  QuotesProvider _quotesProvider;
  final _scrollController = ScrollController();
  final _selectedFilterNotifier = ValueNotifier<int>(0);

  @override
  void initState() {
    _quotesProvider = Provider.of<QuotesProvider>(context, listen: false);
    _quotesProvider.initQuotes();
    super.initState();
  }

  Future _fetchGetQuotes() async {
    callProgressDialog(context);
    var response = await QuotesApi().fetchQuotesApi();
    Navigator.pop(context);
    _fetchProvider(response);
  }

  _fetchProvider(response) {
    if (response["status"]) {
      if (_quotesProvider.isQuoteExist(response["data"].id)) {
        flushBar(message: "Quote Already Exist", context: context);
        return;
      }
      _quotesProvider.addQuote(response["data"]);
      if (_scrollController.hasClients)
        Animations.animateToIndex(0, _scrollController);
    } else {
      flushBar(message: "Check Internet Please", context: context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ValueListenableBuilder(
              valueListenable: _selectedFilterNotifier,
              builder: (context, value, child) => Expanded(
                child: Column(
                  children: [
                    FilteredMenu(
                      selectedFilter: value,
                      onValueChanged: (value) {
                        _selectedFilterNotifier.value = value;
                      },
                    ),
                    Expanded(
                      child: QuotesList(
                        selectedFilter: value,
                        scrollController: _scrollController,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: marginSymmetric(1, 1),
              width: SizeConfig.widthMultiplier * 100,
              child: RaisedButtonWidget(
                  title: "Fetch New Quote", onPressed: _fetchGetQuotes),
            )
          ],
        ),
      ),
    );
  }
}
