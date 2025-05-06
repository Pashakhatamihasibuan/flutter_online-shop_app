import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/rajaongkir_remote_datasource.dart';
import '../../../../data/models/responses/province_response_modal.dart';

part 'province_event.dart';
part 'province_state.dart';
part 'province_bloc.freezed.dart';

class ProvinceBloc extends Bloc<ProvinceEvent, ProvinceState> {
  final RajaongkirRemoteDatasource datasource;

  ProvinceBloc(this.datasource) : super(const ProvinceState.initial()) {
    on<GetProvinces>((event, emit) async {
      emit(const ProvinceState.loading());

      final result = await datasource.searchDestination(event.keyword);

      result.fold(
        (error) => emit(ProvinceState.error(error)),
        (response) {
          final filtered = response.data!
              .where((province) =>
                  province.name != null &&
                  province.name!
                      .toLowerCase()
                      .contains(event.keyword.toLowerCase()))
              .toList();
          emit(ProvinceState.loaded(filtered));
        },
      );
    });
  }
}
