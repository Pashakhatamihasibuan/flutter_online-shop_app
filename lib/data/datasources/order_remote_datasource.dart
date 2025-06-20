import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/datasources/auth_local_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/order_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/order_response_model.dart';
import 'package:http/http.dart' as http;

class OrderRemoteDatasource {
  /// Fungsi untuk membuat pesanan baru
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
          if (errorBody is Map<String, dynamic> &&
              errorBody.containsKey('message')) {
            errorMessage = errorBody['message'];
          }
        } catch (_) {
          errorMessage = response.body;
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

  /// Fungsi untuk mengecek status pembayaran
  Future<Either<String, String>> checkPaymentStatus(String orderId) async {
    try {
      print('🔐 StatusCheck: Getting auth data...');
      final authData = await AuthLocalDatasource().getAuthData();
      if (authData == null) {
        print('❌ StatusCheck: Auth data is null');
        return left('Authentication data not found');
      }
      print('✅ StatusCheck: Auth data retrieved successfully.');

      final url = Uri.parse('${Variables.baseUrl}/api/order/status/$orderId');
      print('🌐 StatusCheck: Making request to: $url');

      final headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}'
      };
      print('📤 StatusCheck: Request headers: $headers');

      final response = await http.get(url, headers: headers);
      print('📡 StatusCheck: Response status code: ${response.statusCode}');
      print('📡 StatusCheck: Response body: ${response.body}');

      if (response.statusCode == 200) {
        // PERBAIKAN: Menggunakan try-catch untuk parsing JSON yang aman
        try {
          final data = jsonDecode(response.body);
          final status = data['status'] as String;
          print('✅ StatusCheck: Payment status is "$status"');
          return right(status);
        } catch (e) {
          print('❌ StatusCheck: Failed to parse status response. Error: $e');
          return left('Failed to parse response');
        }
      } else {
        // PERBAIKAN: Memberikan pesan error yang lebih deskriptif
        print('❌ StatusCheck: Failed to get status. Body: ${response.body}');
        return left('Failed to get payment status');
      }
    } catch (e, stackTrace) {
      print('💥 StatusCheck: Exception occurred: $e');
      print('📚 StatusCheck: Stack trace: $stackTrace');
      return left('Network error: ${e.toString()}');
    }
  }
}
