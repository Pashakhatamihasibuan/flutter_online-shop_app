// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CityResponseModel {
  final List<City>? data;
  final Meta? meta;

  CityResponseModel({
    this.data,
    this.meta,
  });

  factory CityResponseModel.fromJson(String str) =>
      CityResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CityResponseModel.fromMap(Map<String, dynamic> json) =>
      CityResponseModel(
        data: json["data"] == null
            ? []
            : List<City>.from(json["data"]!.map((x) => City.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
      };
}

class City {
  final String? code;
  final String? name;

  City({
    this.code,
    this.name,
  });

  factory City.fromJson(String str) => City.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory City.fromMap(Map<String, dynamic> json) => City(
        code: json["code"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
      };

  @override
  String toString() => '$name';
}

class Meta {
  final int? administrativeAreaLevel;
  final DateTime? updatedAt;

  Meta({
    this.administrativeAreaLevel,
    this.updatedAt,
  });

  factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        administrativeAreaLevel: json["administrative_area_level"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "administrative_area_level": administrativeAreaLevel,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
