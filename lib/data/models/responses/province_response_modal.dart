// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProvinceResponseModel {
  final List<Province>? data;
  final Meta? meta;

  ProvinceResponseModel({
    this.data,
    this.meta,
  });

  factory ProvinceResponseModel.fromJson(String str) =>
      ProvinceResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProvinceResponseModel.fromMap(Map<String, dynamic> json) =>
      ProvinceResponseModel(
        data: json["data"] == null
            ? []
            : List<Province>.from(
                json["data"]!.map((x) => Province.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
      };
}

class Province {
  final String? code;
  final String? name;

  Province({
    this.code,
    this.name,
  });

  factory Province.fromJson(String str) => Province.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Province.fromMap(Map<String, dynamic> json) => Province(
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
