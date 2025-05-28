import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../../../data/models/responses/city_response_model.dart';

class CityRemoteDatasource {
  Future<Either<String, CityResponseModel>> getCities(
      String provinceCode) async {
    final url = Uri.parse('https://api.rajaongkir.com/starter/city');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = CityResponseModel.fromJson(response.body);
        return Right(data);
      } else {
        return const Left('Gagal mengambil data kota');
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
