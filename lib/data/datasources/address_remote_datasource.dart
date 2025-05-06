import 'dart:convert';
import 'package:flutter_onlineshop_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';

class AddressRemoteDatasource {
  Future<Either<String, AddressResponseModel>> getAddress() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      if (authData == null || authData.accessToken!.isEmpty) {
        return Left('Authentication required');
      }

      final response = await http.get(
        Uri.parse('http://192.168.100.217:8000/api/addresses'),
        headers: {
          'Authorization': 'Bearer ${authData.accessToken}',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Validasi JSON sebelum parsing
        final decodedBody = json.decode(response.body);
        if (decodedBody is! Map<String, dynamic>) {
          return Left('Invalid response format');
        }
        return Right(AddressResponseModel.fromJson(response.body));
      } else {
        return Left(
            'Failed to load addresses (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      return Left('Network error: ${e.toString()}');
    }
  }

  Future<Either<String, String>> addAddress(AddressRequestModel data) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      if (authData == null || authData.accessToken!.isEmpty) {
        return Left('Authentication required');
      }

      final response = await http.post(
        Uri.parse('http://192.168.100.217:8000/api/addresses'),
        headers: {
          'Authorization': 'Bearer ${authData.accessToken}',
          'Content-Type': 'application/json',
        },
        body: json.encode(data.toMap()),
      );

      if (response.statusCode == 201) {
        return const Right('Address added successfully');
      } else {
        return Left(
            'Failed to add address (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      return Left('Network error: ${e.toString()}');
    }
  }

  Future<Either<String, String>> updateAddress(
      int id, AddressRequestModel data) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      if (authData == null || authData.accessToken!.isEmpty) {
        return Left('Authentication required');
      }

      final response = await http.put(
        Uri.parse('http://192.168.100.217:8000/api/addresses/$id'),
        headers: {
          'Authorization': 'Bearer ${authData.accessToken}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(data.toJson()),
      );

      if (response.statusCode == 200) {
        return const Right('Address updated successfully');
      } else {
        return Left(
            'Failed to update address (${response.statusCode}): ${response.body}');
      }
    } catch (e) {
      return Left('Network error: ${e.toString()}');
    }
  }
}
