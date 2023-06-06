import '../../domain/entities/quote.dart';

class QuoteModel extends Quote {
  QuoteModel(
      {required super.author,
      required super.id,
      required super.content,
      required super.permalink});

factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
author: json["author"],
id: json["id"],
content: json["quote"],
permalink: json["permalink"],
);

Map<String, dynamic> toJson() => {
  "author": author,
  "id": id,
  "quote": content,
  "permalink": permalink,
};
}


