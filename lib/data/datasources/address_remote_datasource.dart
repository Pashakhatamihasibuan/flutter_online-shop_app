import 'dart:convert'; // ✅ untuk jsonEncode dan jsonDecode
import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';
import 'package:http/http.dart' as http;

class AddressRemoteDataSource {
  Future<Either<String, AddressResponseModel>> getAddresses() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.get(
        Uri.parse('${Variables.baseUrl}/api/addresses'),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
        },
      );

      print('📥 RESPONSE CODE: ${response.statusCode}');
      print('📥 RESPONSE BODY: ${response.body}');

      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final decoded = jsonDecode(response.body);
        return Right(AddressResponseModel.fromMap(
            decoded)); // gunakan fromMap dengan Map
      } else {
        return Left('Error: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      return Left('Exception: ${e.toString()}');
    }
  }

  Future<Either<String, String>> addAddress(AddressRequestModel data) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/addresses'),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(
            data.toMap()), // gunakan jsonEncode dengan Map dari toMap()
      );

      print('📤 ADD RESPONSE CODE: ${response.statusCode}');
      print('📤 ADD RESPONSE BODY: ${response.body}');

      if (response.statusCode == 201) {
        return const Right('Success');
      } else {
        return Left('Failed to add address: ${response.body}');
      }
    } catch (e) {
      return Left('Exception: ${e.toString()}');
    }
  }

  Future<Either<String, AddressResponseModel>> updateAddresses(
    int id,
    AddressRequestModel requestModel,
  ) async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      final response = await http.put(
        Uri.parse('${Variables.baseUrl}/api/addresses/$id'),
        headers: {
          'Authorization': 'Bearer ${authData!.accessToken}',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(requestModel.toMap()),
      );

      print('📤 UPDATE RESPONSE CODE: ${response.statusCode}');
      print('📤 UPDATE RESPONSE BODY: ${response.body}');

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final decoded = jsonDecode(response.body);
          return Right(AddressResponseModel.fromMap(decoded));
        } else {
          // Kalau kosong, kembalikan response tanpa data, misalnya:
          return Right(AddressResponseModel(status: "success", data: []));
        }
      } else {
        return Left('Failed to update address: ${response.body}');
      }
    } catch (e) {
      return Left('Exception: ${e.toString()}');
    }
  }
}
