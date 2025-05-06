import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/rajaongkir_remote_datasource.dart';
import '../../../../data/models/responses/district_response_model.dart';

part 'district_event.dart';
part 'district_state.dart';
part 'district_bloc.freezed.dart';

class DistrictBloc extends Bloc<DistrictEvent, DistrictState> {
  final RajaongkirRemoteDatasource datasource;

  DistrictBloc(this.datasource) : super(const DistrictState.initial()) {
    on<GetDistrictByRegencyCode>((event, emit) async {
      emit(const DistrictState.loading());

      final result = await datasource.getDistricts(event.regencyCode);

      result.fold(
        (failure) => emit(DistrictState.error(failure)),
        (response) => emit(DistrictState.loaded(response.data ?? [])),
      );
    });
  }
}
