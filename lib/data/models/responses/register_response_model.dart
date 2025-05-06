import 'dart:convert';

class RegisterResponseModel {
  final String accessToken;
  final User user;

  RegisterResponseModel({
    required this.accessToken,
    required this.user,
  });

  factory RegisterResponseModel.fromJson(String str) =>
      RegisterResponseModel.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory RegisterResponseModel.fromMap(Map<String, dynamic> json) {
    if (!json.containsKey('access_token') || !json.containsKey('user')) {
      throw Exception('Respons tidak lengkap');
    }

    return RegisterResponseModel(
      accessToken: json["access_token"] as String,
      user: User.fromMap(json["user"] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        "access_token": accessToken,
        "user": user.toMap(),
      };
}

class User {
  final String name;
  final String email;
  final String phone;
  final String roles;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  User({
    required this.name,
    required this.email,
    required this.phone,
    required this.roles,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory User.fromJson(String str) =>
      User.fromMap(json.decode(str) as Map<String, dynamic>);

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) {
    return User(
      name: json["name"] as String,
      email: json["email"] as String,
      phone: json["phone"] as String,
      roles: json["roles"] as String,
      updatedAt: DateTime.parse(json["updated_at"] as String),
      createdAt: DateTime.parse(json["created_at"] as String),
      id: json["id"] as int,
    );
  }

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "phone": phone,
        "roles": roles,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
