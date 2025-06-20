import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/order_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_order_event.dart';
part 'status_order_state.dart';
part 'status_order_bloc.freezed.dart';

class StatusOrderBloc extends Bloc<StatusOrderEvent, StatusOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;

  StatusOrderBloc(
    this.orderRemoteDatasource,
  ) : super(const StatusOrderInitial()) {
    on<CheckPaymentStatus>((event, emit) async {
      emit(const StatusOrderState.loading());
      final result = await orderRemoteDatasource
          .checkPaymentStatus(event.orderId as String);
      result.fold(
        (l) => emit(StatusOrderState.error(l)),
        (r) => emit(StatusOrderState.loaded(r)),
      );
    });
  }
}
