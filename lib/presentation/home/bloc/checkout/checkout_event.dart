part of 'checkout_bloc.dart';

@freezed
class CheckoutEvent with _$CheckoutEvent {
  const factory CheckoutEvent.started() = Started;
  const factory CheckoutEvent.addItem(Product product) = AddItem;
  const factory CheckoutEvent.removeItem(Product product) = RemoveItem;

  const factory CheckoutEvent.updateQuantity({
    required Product product,
    required int quantity,
  }) = UpdateQuantity;
}
