import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/rajaongkir_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/cost_respoonse_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'cost_event.dart';
part 'cost_state.dart';
part 'cost_bloc.freezed.dart';

class CostBloc extends Bloc<CostEvent, CostState> {
  final RajaongkirRemoteDatasource rajaRajaongkirRemoteDatasource;

  CostBloc(this.rajaRajaongkirRemoteDatasource) : super(const CostInitial()) {
    on<GetCost>(
      (event, emit) async {
        emit(const CostState.loading());

        final result = await rajaRajaongkirRemoteDatasource.getCost(
          event.origin,
          event.destination,
          event.courier,
        );

        result.fold(
          (l) => emit(CostState.error(l)),
          (r) => emit(CostState.loaded(r)),
        );
      },
    );
  }
}
