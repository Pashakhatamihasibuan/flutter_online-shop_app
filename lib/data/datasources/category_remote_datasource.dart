import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';
import 'package:http/http.dart' as http;

class CategoryRemoteDatasource {
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final response =
        await http.get(Uri.parse('${Variables.baseUrl}/api/categories'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Right(CategoryResponseModel.fromJson(data));
    } else {
      return const Left('Internal Server Error');
    }
  }
}
