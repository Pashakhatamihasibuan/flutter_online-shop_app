import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:http/http.dart' as http;

import '../models/responses/product_response_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getAllProduct() async {
    try {
      final response =
          await http.get(Uri.parse('${Variables.baseUrl}/api/products'));

      if (response.statusCode == 200) {
        // Parse response body menjadi Map<String, dynamic> dan gunakan data tersebut
        final data = jsonDecode(response.body);
        return Right(ProductResponseModel.fromMap(
            data)); // Menggunakan fromMap bukan fromJson
      } else {
        return Left('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }

  Future<Either<String, ProductResponseModel>> getProductByCategory(
      int categoryId) async {
    try {
      final response = await http.get(Uri.parse(
          '${Variables.baseUrl}/api/products?category_id=$categoryId'));

      if (response.statusCode == 200) {
        // Parse response body menjadi Map<String, dynamic> dan gunakan data tersebut
        final data = jsonDecode(response.body);
        return Right(ProductResponseModel.fromMap(
            data)); // Menggunakan fromMap bukan fromJson
      } else {
        return Left('Failed to load products: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error occurred: $e');
    }
  }
}
