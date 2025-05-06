// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class DisctrictResponseModel {
  final List<District>? data;
  final Meta? meta;

  DisctrictResponseModel({
    this.data,
    this.meta,
  });

  factory DisctrictResponseModel.fromJson(String str) =>
      DisctrictResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DisctrictResponseModel.fromMap(Map<String, dynamic> json) =>
      DisctrictResponseModel(
        data: json["data"] == null
            ? []
            : List<District>.from(
                json["data"]!.map((x) => District.fromMap(x))),
        meta: json["meta"] == null ? null : Meta.fromMap(json["meta"]),
      );

  Map<String, dynamic> toMap() => {
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "meta": meta?.toMap(),
      };
}

class District {
  final String? code;
  final String? name;

  District({
    this.code,
    this.name,
  });

  factory District.fromJson(String str) => District.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory District.fromMap(Map<String, dynamic> json) => District(
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
