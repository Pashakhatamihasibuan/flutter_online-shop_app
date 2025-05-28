part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = Started;
  const factory CheckoutEvent.addItem(Product product) = AddItem;
  const factory CheckoutEvent.removeItem(Product product) = RemoveItem;
  const factory CheckoutEvent.updateQuantity(Product product, int quantity) =
      UpdateQuantity;
  const factory CheckoutEvent.clearCart() = ClearCart;
  const factory CheckoutEvent.addAddressId(int addressId) = AddAddressId;
  const factory CheckoutEvent.addPaymentMethod(
      String paymentMethod, String paymentVaName) = AddPaymentMethod;
  const factory CheckoutEvent.addShippingService(
      String shippingService, int shippingCost) = AddShippingService;
}
