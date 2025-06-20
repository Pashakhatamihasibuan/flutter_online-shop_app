part of 'order_bloc.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = DoOrderInitial;
  const factory OrderState.loading() = DoOrderLoading;
  const factory OrderState.loaded(
    OrderResponseModel orderResponseModel,
  ) = DoOrderLoaded;
  const factory OrderState.error(String message) = DoOrderError;
}
