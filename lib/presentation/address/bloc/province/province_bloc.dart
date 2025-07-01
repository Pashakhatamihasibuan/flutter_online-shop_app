import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_modal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  // Hapus ketergantungan pada RajaongkirRemoteDatasource
  ProvinceBloc() : super(const ProvinceState.initial()) {
    on<GetProvinces>((event, emit) async {
      emit(const ProvinceState.loading());
      try {
        // Memuat data dari file JSON lokal
        final response =
            await rootBundle.loadString('assets/json/province.json');
        final decodedResponse = jsonDecode(response);
        final provinces = ProvinceResponseModel.fromMap(decodedResponse);

        emit(ProvinceState.loaded(provinces.rajaongkir?.results ?? []));
      } catch (e) {
        emit(ProvinceState.error('Gagal memuat data provinsi: $e'));
      }
    });
  }
}
