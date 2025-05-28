import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/rajaongkir_remote_datasource.dart';
import '../../../../data/models/responses/city_response_model.dart';

part 'city_event.dart';
part 'city_state.dart';
part 'city_bloc.freezed.dart';

class CityBloc extends Bloc<CityEvent, CityState> {
  final RajaongkirRemoteDatasource rajaongkirRemoteDatasource;

  CityBloc(this.rajaongkirRemoteDatasource) : super(const CityState.initial()) {
    on<GetCity>((event, emit) async {
      emit(const CityState.loading());

      final result =
          await rajaongkirRemoteDatasource.getCitiesByProvince(event.provId);

      result.fold(
        (failure) => emit(CityState.error(failure)),
        (response) =>
            emit(CityState.loaded(response.rajaongkir?.results ?? [])),
      );
    });
  }
}
