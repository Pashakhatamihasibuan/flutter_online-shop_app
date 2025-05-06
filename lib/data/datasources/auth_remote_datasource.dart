import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

import '../../core/constants/variables.dart';
import 'auth_local_datasource.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }

  // Logout
  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/logout'),
        headers: {'Authorization': 'Bearer ${authData?.accessToken}'});

    if (response.statusCode == 200) {
      await AuthLocalDatasource().removeAuthData();
      return const Right('Success');
    } else {
      return const Left('Internal Server Error');
    }
  }
}
