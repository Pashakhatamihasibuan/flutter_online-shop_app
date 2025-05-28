import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/rajaongkir_remote_datasource.dart';
import '../../../../data/models/responses/province_response_modal.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;

  ProvinceBloc(this.rajaongkirRemoteDatasource)
      : super(const ProvinceState.initial()) {
    on<GetProvinces>((event, emit) async {
      emit(const ProvinceState.loading());
      final response = await rajaongkirRemoteDatasource.getProvinces();
      response.fold(
        (l) => emit(ProvinceError(l)),
        (r) => emit(ProvinceLoaded(r.rajaongkir?.results ?? [])),
      );
    });
  }
}
