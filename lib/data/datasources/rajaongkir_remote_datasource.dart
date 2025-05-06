import 'package:dartz/dartz.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/district_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_modal.dart';
import 'package:http/http.dart' as http;

class RajaongkirRemoteDatasource {
  // Ambil daftar provinsi
  Future<Either<String, ProvinceResponseModel>> searchDestination(
      String keyword) async {
    final url = Uri.parse('https://wilayah.id/api/provinces.json');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Right(ProvinceResponseModel.fromJson(response.body));
      } else {
        return const Left('Gagal mengambil data provinsi');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Ambil daftar kota berdasarkan kode provinsi
  Future<Either<String, CityResponseModel>> getCities(
      String provinceCode) async {
    final url =
        Uri.parse('https://wilayah.id/api/regencies/$provinceCode.json');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Right(CityResponseModel.fromJson(response.body));
      } else {
        return const Left('Gagal mengambil data kota');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  // Ambil daftar kecamatan berdasarkan kode kota
  Future<Either<String, DisctrictResponseModel>> getDistricts(
      String regencyCode) async {
    final url = Uri.parse('https://wilayah.id/api/districts/$regencyCode.json');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        return Right(DisctrictResponseModel.fromJson(response.body));
      } else {
        return const Left('Gagal mengambil data kecamatan');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
