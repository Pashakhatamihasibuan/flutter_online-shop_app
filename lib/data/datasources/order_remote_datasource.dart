import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/order_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  Future<Either<String, OrderResponseModel>> order(
      OrderRequestModel orderRequestModel) async {
    try {
      print('🔐 OrderRemoteDatasource: Getting auth data...');
      final authData = await AuthLocalDatasource().getAuthData();

      if (authData == null) {
        print('❌ OrderRemoteDatasource: Auth data is null');
        return left('Authentication data not found');
      }

      print('✅ OrderRemoteDatasource: Auth data retrieved successfully');

      final url = '${Variables.baseUrl}/api/order';
      print('🌐 OrderRemoteDatasource: Making request to: $url');

      final headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}'
      };

      final body = jsonEncode(orderRequestModel.toMap());
      print('📤 OrderRemoteDatasource: Request headers: $headers');
      print('📤 OrderRemoteDatasource: Request body: $body');

      final response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: body,
      );

      print(
          '📡 OrderRemoteDatasource: Response status code: ${response.statusCode}');
      print('📡 OrderRemoteDatasource: Response headers: ${response.headers}');
      print('📡 OrderRemoteDatasource: Response body: ${response.body}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        try {
          final jsonResponse = jsonDecode(response.body);
          print('✅ OrderRemoteDatasource: Successfully parsed JSON response');
          print('📄 OrderRemoteDatasource: Parsed response: $jsonResponse');

          final orderResponse = OrderResponseModel.fromJson(jsonResponse);
          print(
              '✅ OrderRemoteDatasource: Successfully created OrderResponseModel');

          // Log the payment details specifically
          if (orderResponse.order != null) {
            print(
                '💳 OrderRemoteDatasource: Order payment method: ${orderResponse.order!.paymentMethod}');
            print(
                '🏦 OrderRemoteDatasource: Order payment VA name: ${orderResponse.order!.paymentVaName}');
            print(
                '🔢 OrderRemoteDatasource: Order payment VA number: ${orderResponse.order!.paymentVaNumber}');
          }

          return right(orderResponse);
        } catch (e, stackTrace) {
          print('❌ OrderRemoteDatasource: Error parsing response: $e');
          print('📚 OrderRemoteDatasource: Stack trace: $stackTrace');
          return left('Failed to parse response: ${e.toString()}');
        }
      } else {
        String errorMessage = 'HTTP ${response.statusCode}';

        try {
          final errorBody = jsonDecode(response.body);
          print('❌ OrderRemoteDatasource: Error response body: $errorBody');

          if (errorBody is Map<String, dynamic>) {
            if (errorBody.containsKey('message')) {
              errorMessage = errorBody['message'].toString();
            } else if (errorBody.containsKey('error')) {
              errorMessage = errorBody['error'].toString();
            } else if (errorBody.containsKey('errors')) {
              errorMessage = errorBody['errors'].toString();
            }
          }
        } catch (e) {
          print(
              '⚠️ OrderRemoteDatasource: Could not parse error response, using raw body');
          errorMessage = response.body.isNotEmpty
              ? response.body
              : 'HTTP ${response.statusCode}';
        }

        print(
            '❌ OrderRemoteDatasource: Request failed with error: $errorMessage');
        return left(errorMessage);
      }
    } catch (e, stackTrace) {
      print('💥 OrderRemoteDatasource: Exception occurred: $e');
      print('📚 OrderRemoteDatasource: Stack trace: $stackTrace');
      return left('Network error: ${e.toString()}');
    }
  }
}
