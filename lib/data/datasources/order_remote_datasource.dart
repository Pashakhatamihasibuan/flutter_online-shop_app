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

  /// Fungsi untuk mengecek status pembayaran (Legacy - untuk payment status saja)
  Future<Either<String, String>> checkPaymentStatus(String orderId) async {
    try {
      print('🔐 StatusCheck: Getting auth data...');
      final authData = await AuthLocalDatasource().getAuthData();
      if (authData == null) {
        print('❌ StatusCheck: Auth data is null');
        return left('Authentication data not found');
      }
      print('✅ StatusCheck: Auth data retrieved successfully.');

      // PERBAIKAN: Menggunakan endpoint yang benar untuk payment status
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
        try {
          final jsonResponse = jsonDecode(response.body);

          // PERBAIKAN: Parsing response yang benar sesuai struktur API
          if (jsonResponse is Map<String, dynamic> &&
              jsonResponse['success'] == true &&
              jsonResponse['data'] != null) {
            final orderData = jsonResponse['data'] as Map<String, dynamic>;

            // PERBAIKAN: Ambil payment_status dari dalam data object
            final paymentStatus =
                orderData['payment_status'] as String? ?? 'unknown';

            print('✅ StatusCheck: Payment status is "$paymentStatus"');
            return right(paymentStatus);
          } else {
            print('❌ StatusCheck: Invalid response structure');
            return left('Invalid response structure');
          }
        } catch (e) {
          print('❌ StatusCheck: Failed to parse status response. Error: $e');
          return left('Failed to parse response');
        }
      } else {
        print('❌ StatusCheck: Failed to get status. Body: ${response.body}');
        return left('Failed to get payment status');
      }
    } catch (e, stackTrace) {
      print('💥 StatusCheck: Exception occurred: $e');
      print('📚 StatusCheck: Stack trace: $stackTrace');
      return left('Network error: ${e.toString()}');
    }
  }

  /// PERBAIKAN UTAMA: Fungsi baru untuk mengecek status order lengkap
  Future<Either<String, Map<String, dynamic>>> checkOrderStatus(
      String orderId) async {
    try {
      print('🔐 OrderStatusCheck: Getting auth data...');
      final authData = await AuthLocalDatasource().getAuthData();
      if (authData == null) {
        print('❌ OrderStatusCheck: Auth data is null');
        return left('Authentication data not found');
      }
      print('✅ OrderStatusCheck: Auth data retrieved successfully.');

      // PERBAIKAN: Menggunakan endpoint yang benar untuk order status
      final url = Uri.parse('${Variables.baseUrl}/api/order/status/$orderId');
      print('🌐 OrderStatusCheck: Making request to: $url');

      final headers = {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'Authorization': 'Bearer ${authData.accessToken}'
      };
      print('📤 OrderStatusCheck: Request headers: $headers');

      final response = await http.get(url, headers: headers);
      print(
          '📡 OrderStatusCheck: Response status code: ${response.statusCode}');
      print('📡 OrderStatusCheck: Response body: ${response.body}');

      if (response.statusCode == 200) {
        try {
          final jsonResponse = jsonDecode(response.body);
          print('✅ OrderStatusCheck: Successfully parsed JSON response');

          // PERBAIKAN: Parsing response struktur yang benar
          if (jsonResponse is Map<String, dynamic> &&
              jsonResponse['success'] == true &&
              jsonResponse['data'] != null) {
            final orderData = jsonResponse['data'] as Map<String, dynamic>;

            // PERBAIKAN: Ekstrak data dengan null safety
            final orderStatus = {
              'order_id': orderData['order_id'] ?? 0,
              'transaction_number': orderData['transaction_number'] ?? '',
              'status': orderData['status'] ?? 'pending',
              'payment_status': orderData['payment_status'] ?? 'pending',
              'payment_method': orderData['payment_method'] ?? '',
              'payment_va_number': orderData['payment_va_number'] ?? '',
              'subtotal': orderData['subtotal'] ?? 0,
              'shipping_cost': orderData['shipping_cost'] ?? 0,
              'total_cost': orderData['total_cost'] ?? 0,
              'shipping_service': orderData['shipping_service'] ?? '',
              'created_at': orderData['created_at'] ?? '',
              'updated_at': orderData['updated_at'] ?? '',
              'items': orderData['items'] ?? [],
            };

            print('✅ OrderStatusCheck: Order status: ${orderStatus['status']}');
            print(
                '✅ OrderStatusCheck: Payment status: ${orderStatus['payment_status']}');

            return right(orderStatus);
          } else {
            print('❌ OrderStatusCheck: Invalid response structure');
            return left('Invalid response structure');
          }
        } catch (e) {
          print(
              '❌ OrderStatusCheck: Failed to parse status response. Error: $e');
          return left('Failed to parse response');
        }
      } else {
        print(
            '❌ OrderStatusCheck: Failed to get status. Body: ${response.body}');

        // PERBAIKAN: Handle error response
        try {
          final errorResponse = jsonDecode(response.body);
          final errorMessage =
              errorResponse['message'] ?? 'Failed to get order status';
          return left(errorMessage);
        } catch (_) {
          return left('Failed to get order status');
        }
      }
    } catch (e, stackTrace) {
      print('💥 OrderStatusCheck: Exception occurred: $e');
      print('📚 OrderStatusCheck: Stack trace: $stackTrace');
      return left('Error checking payment status: ${e.toString()}');
    }
  }

  /// PERBAIKAN: Fungsi khusus untuk mengecek payment status saja
  Future<Either<String, String>> getPaymentStatus(String orderId) async {
    final result = await checkOrderStatus(orderId);
    return result.fold(
      (error) => left(error),
      (orderData) => right(orderData['payment_status'] as String? ?? 'pending'),
    );
  }

  /// PERBAIKAN: Fungsi khusus untuk mengecek order status saja
  Future<Either<String, String>> getOrderStatus(String orderId) async {
    final result = await checkOrderStatus(orderId);
    return result.fold(
      (error) => left(error),
      (orderData) => right(orderData['status'] as String? ?? 'pending'),
    );
  }
}
