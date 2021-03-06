import 'package:hive/hive.dart';

part 'quotes_model.g.dart';

@HiveType(typeId: 0)
class QuotesModel extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String author;

  @HiveField(2)
  String quote;

  @HiveField(3)
  String permalink;

  @HiveField(4)
  bool isLiked;

  QuotesModel(
      {this.id, this.author, this.quote, this.permalink, this.isLiked = false});

  factory QuotesModel.fromJson(Map<String, dynamic> responseData) {
    return QuotesModel(
      id: responseData["id"],
      author: responseData["author"],
      quote: responseData["quote"],
      permalink: responseData["permalink"],
    );
  }
}
