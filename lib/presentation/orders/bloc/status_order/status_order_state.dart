part of 'status_order_bloc.dart';

@freezed
class StatusOrderState with _$StatusOrderState {
  const factory StatusOrderState.initial() = StatusOrderInitial;
  const factory StatusOrderState.loading() = StatusOrderLoading;
  const factory StatusOrderState.loaded(String status) = StatusOrderLoaded;
  const factory StatusOrderState.error(String message) = StatusOrderError;
}
