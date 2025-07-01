import 'dart:convert';

class CostResponseModel {
  final Rajaongkir? rajaongkir;

  CostResponseModel({
    this.rajaongkir,
  });

  factory CostResponseModel.fromJson(String str) =>
      CostResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CostResponseModel.fromMap(Map<String, dynamic> json) =>
      CostResponseModel(
        rajaongkir: json["rajaongkir"] == null
            ? null
            : Rajaongkir.fromMap(json["rajaongkir"]),
      );

  Map<String, dynamic> toMap() => {
        "rajaongkir": rajaongkir?.toMap(),
      };
}

class Rajaongkir {
  final dynamic query; // Changed to dynamic to handle both Map and List
  final Status? status;
  final List<CostResult>? results;

  Rajaongkir({
    this.query,
    this.status,
    this.results,
  });

  factory Rajaongkir.fromJson(String str) =>
      Rajaongkir.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rajaongkir.fromMap(Map<String, dynamic> json) => Rajaongkir(
        query: json["query"], // Keep as dynamic
        status: json["status"] == null ? null : Status.fromMap(json["status"]),
        results: json["results"] == null
            ? []
            : List<CostResult>.from(
                json["results"]!.map((x) => CostResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "query": query,
        "status": status?.toMap(),
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class CostResult {
  final String? code;
  final String? name;
  final List<Cost>? costs;

  CostResult({
    this.code,
    this.name,
    this.costs,
  });

  factory CostResult.fromJson(String str) =>
      CostResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CostResult.fromMap(Map<String, dynamic> json) => CostResult(
        code: json["code"]?.toString(),
        name: json["name"]?.toString(),
        costs: json["costs"] == null
            ? []
            : List<Cost>.from(json["costs"]!.map((x) => Cost.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "name": name,
        "costs": costs == null
            ? []
            : List<dynamic>.from(costs!.map((x) => x.toMap())),
      };
}

class Cost {
  final String? service;
  final String? description;
  final List<CostDetail>? cost;

  Cost({
    this.service,
    this.description,
    this.cost,
  });

  factory Cost.fromJson(String str) => Cost.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Cost.fromMap(Map<String, dynamic> json) => Cost(
        service: json["service"]?.toString(),
        description: json["description"]?.toString(),
        cost: json["cost"] == null
            ? []
            : List<CostDetail>.from(
                json["cost"]!.map((x) => CostDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "service": service,
        "description": description,
        "cost":
            cost == null ? [] : List<dynamic>.from(cost!.map((x) => x.toMap())),
      };
}

class CostDetail {
  final int? value;
  final String? etd;
  final String? note;

  CostDetail({
    this.value,
    this.etd,
    this.note,
  });

  factory CostDetail.fromJson(String str) =>
      CostDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CostDetail.fromMap(Map<String, dynamic> json) => CostDetail(
        value: json["value"] is String
            ? int.tryParse(json["value"])
            : json["value"]?.toInt(),
        etd: json["etd"]?.toString(),
        note: json["note"]?.toString(),
      );

  Map<String, dynamic> toMap() => {
        "value": value,
        "etd": etd,
        "note": note,
      };
}

class Status {
  final int? code;
  final String? description;

  Status({
    this.code,
    this.description,
  });

  factory Status.fromJson(String str) => Status.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Status.fromMap(Map<String, dynamic> json) => Status(
        code: json["code"] is String
            ? int.tryParse(json["code"])
            : json["code"]?.toInt(),
        description: json["description"]?.toString(),
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "description": description,
      };
}
