import 'dart:convert';

CarListModel carListModelFromMap(String str) => CarListModel.fromMap(json.decode(str));

String carListModelToMap(CarListModel data) => json.encode(data.toMap());

class CarListModel {
  String? status;
  List<CarDate>? data;
  String? message;

  CarListModel({
    this.status,
    this.data,
    this.message,
  });

  factory CarListModel.fromMap(Map<String, dynamic> json) => CarListModel(
    status: json["status"],
    data: json["data"] == null ? [] : List<CarDate>.from(json["data"]!.map((x) => CarDate.fromMap(x))),
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
    "message": message,
  };
}

class CarDate {
  String? id;
  String? make;
  String? model;
  int? year;
  String? type;
  int? seats;
  int? bags;
  List<String>? features;
  Rates? rates;
  String? imageUrl;

  CarDate({
    this.id,
    this.make,
    this.model,
    this.year,
    this.type,
    this.seats,
    this.bags,
    this.features,
    this.rates,
    this.imageUrl,
  });

  factory CarDate.fromMap(Map<String, dynamic> json) => CarDate(
    id: json["id"],
    make: json["make"],
    model: json["model"],
    year: json["year"],
    type: json["type"],
    seats: json["seats"],
    bags: json["bags"],
    features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
    rates: json["rates"] == null ? null : Rates.fromMap(json["rates"]),
    imageUrl: json["imageURL"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "make": make,
    "model": model,
    "year": year,
    "type": type,
    "seats": seats,
    "bags": bags,
    "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
    "rates": rates?.toMap(),
    "imageURL": imageUrl,
  };
}

class Rates {
  int? hourly;
  int? daily;
  int? weekly;

  Rates({
    this.hourly,
    this.daily,
    this.weekly,
  });

  factory Rates.fromMap(Map<String, dynamic> json) => Rates(
    hourly: json["hourly"],
    daily: json["daily"],
    weekly: json["weekly"],
  );

  Map<String, dynamic> toMap() => {
    "hourly": hourly,
    "daily": daily,
    "weekly": weekly,
  };
}
