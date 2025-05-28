import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/core/constants/variables.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/cost_respoonse_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_modal.dart';
import 'package:http/http.dart' as http;

// import '../models/responses/cost_respoonse_model.dart';

class RajaongkirRemoteDatasource {
  // Ambil daftar provinsi
  Future<Either<String, ProvinceResponseModel>> getProvinces() async {
    final url = Uri.parse('https://api.rajaongkir.com/starter/province');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(ProvinceResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

  // Ambil daftar kota berdasarkan kode provinsi
  //city by province
  Future<Either<String, CityResponseModel>> getCitiesByProvince(
      String provinceId) async {
    final url = Uri.parse(
        'https://api.rajaongkir.com/starter/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
      },
    );
    if (response.statusCode == 200) {
      return right(CityResponseModel.fromJson(response.body));
    } else {
      return left('Error');
    }
  }

// Cost
  Future<Either<String, CostResponseModel>> getCost(
      String origin, String destination, String courier) async {
    final url = Uri.parse('https://api.rajaongkir.com/starter/cost');

    final response = await http.post(
      url,
      headers: {
        'key': Variables.rajaOngkirKey,
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: {
        'origin': origin,
        'destination': destination,
        'weight': 1000.toString(),
        'courier': courier,
      },
    );

    if (response.statusCode == 200) {
      return Right(CostResponseModel.fromJson(response.body));
    } else {
      return const Left('Gagal mengambil data Ongkir');
    }
  }
}
