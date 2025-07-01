import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  CityBloc() : super(const CityState.initial()) {
    on<GetByProvinceId>((event, emit) async {
      emit(const CityState.loading());
      try {
        final response = await rootBundle.loadString('assets/json/city.json');
        final decodedResponse = jsonDecode(response);
        final allCitiesResponse = CityResponseModel.fromMap(decodedResponse);
        final allCities = allCitiesResponse.rajaongkir?.results ?? [];

        // Fix: Direct string comparison since both are strings
        final filteredCities = allCities.where((city) {
          return city.provinceId == event.provinceId;
        }).toList();

        emit(CityState.loaded(filteredCities));
      } catch (e) {
        emit(CityState.error('Gagal memuat data kota: $e'));
      }
    });
  }
}
