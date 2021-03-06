import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quotes/model/quotes_model.dart';

class QuotesProvider with ChangeNotifier {
  final _quotesBox = Hive.box('quotesBox');
  Map<String, QuotesModel> _quotes = Map();

  void initQuotes() {
    _quotes.addAll(_quotesBox.toMap().cast<String, QuotesModel>());
  }

  List<QuotesModel> get getQuote => [..._quotes.values.toList().reversed];
  List<QuotesModel> get getLikedQuotes =>
      [..._quotes.values.where((element) => element.isLiked).toList().reversed];

  void addQuote(QuotesModel quote) {
    if (!isQuoteExist(quote.id)) {
      _quotes.putIfAbsent(quote.id.toString(), () => quote);
      _quotesBox.put("${quote.id}", quote);
    }
    notifyListeners();
  }

  bool isQuoteExist(int id) {
    return _quotes.containsKey(id.toString());
  }

  void updateLikedQuote(int id) {
    _quotes.update(
        id.toString(),
        (existingQuote) => QuotesModel(
              id: existingQuote.id,
              author: existingQuote.author,
              quote: existingQuote.quote,
              isLiked: !existingQuote.isLiked,
              permalink: existingQuote.quote,
            ));
    _quotesBox.put(id.toString(), _quotes[id.toString()]);
    notifyListeners();
  }

  void deleteQuote(int id) {
    _quotesBox.delete(id.toString());
    _quotes.remove(id.toString());
    notifyListeners();
  }

  void deleteAll() {
    _quotes.clear();
    _quotesBox.clear();
    notifyListeners();
  }
}
