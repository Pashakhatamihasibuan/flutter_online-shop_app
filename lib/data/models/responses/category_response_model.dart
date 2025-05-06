class CategoryResponseModel {
  final String? message;
  final List<Category> data;

  CategoryResponseModel({
    this.message,
    required this.data,
  });

  factory CategoryResponseModel.fromJson(Map<String, dynamic> json) =>
      CategoryResponseModel(
        message: json["message"] ?? json["massage"], // fallback kalau typo
        data: json["data"] == null
            ? []
            : List<Category>.from(
                (json["data"] as List).map((x) => Category.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Category {
  final int? id;
  final String? name;
  final String? description;
  final String? image_url;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.description,
    this.image_url,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        image_url: json["image_url"],
        createdAt: json["created_at"] != null
            ? DateTime.tryParse(json["created_at"])
            : null,
        updatedAt: json["updated_at"] != null
            ? DateTime.tryParse(json["updated_at"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image_url": image_url,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
