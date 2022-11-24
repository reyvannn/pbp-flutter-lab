import 'dart:convert';

class Fields {
  Fields({
    required this.watched,
    required this.title,
    required this.rating,
    required this.releaseDate,
    required this.review,
  });
  bool watched;
  String title;
  int rating;
  String releaseDate;
  String review;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    watched: json["watched"],
    title: json["title"],
    rating: json["rating"],
    releaseDate: json["release_date"],
    review: json["review"],
  );

  Map<String, dynamic> toJson() => {
    "watched": watched,
    "title": title,
    "rating": rating,
    "release_date": releaseDate,
    "review": review,
  };
}

class myWatchList {
  myWatchList({
    required this.model,
    required this.pk,
    required this.fields,
  });
  String model;
  int pk;
  Fields fields;

  factory myWatchList.fromJson(Map<String, dynamic> json) => myWatchList(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}
List<myWatchList> myWatchListFromJson(String str) => List<myWatchList>.from(
    json.decode(str).map((x) => myWatchList.fromJson(x)));

String myWatchListToJson(List<myWatchList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));