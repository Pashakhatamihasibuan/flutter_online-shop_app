part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = CheckoutInitial;
  const factory CheckoutState.loading() = CheckoutLoading;
  const factory CheckoutState.loaded(
    List<ProductQuantity> products,
    int addressId,
    String paymentMethod,
    String paymentVaName,
    String shippingService,
    int shippingCost,
  ) = CheckoutLoaded;
  const factory CheckoutState.error(String message) = CheckoutError;
}
