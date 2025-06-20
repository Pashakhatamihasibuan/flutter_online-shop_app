part of 'status_order_bloc.dart';

@freezed
class StatusOrderEvent with _$StatusOrderEvent {
  const factory StatusOrderEvent.started() = StatusOrderStarted;
  const factory StatusOrderEvent.checkPaymentStatus(String orderId) =
      CheckPaymentStatus;
}
