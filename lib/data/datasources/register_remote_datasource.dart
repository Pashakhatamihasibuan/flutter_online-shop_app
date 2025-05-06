import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/responses/register_response_model.dart';

class RegisterRemoteDatasource {
  final http.Client client;

  RegisterRemoteDatasource({required this.client});

  Future<RegisterResponseModel> register({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String roles,
  }) async {
    final response = await http.post(
      Uri.parse('http://192.168.100.217:8000/api/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': name,
        'email': email,
        'phone': phone,
        'password': password,
        'roles': 'user',
      }),
    );

    print('STATUS CODE: ${response.statusCode}');
    print('RESPONSE BODY: ${response.body}');

    if (response.statusCode == 201) {
      // ⬇️ DI SINI tempatnya baris yang kamu tanya tadi
      final responseModel = RegisterResponseModel.fromMap(
        jsonDecode(response.body) as Map<String, dynamic>,
      );

      return responseModel;
    } else {
      throw Exception('Registrasi gagal dengan status ${response.statusCode}');
    }
  }
}
