import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/models/product_quantity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const CheckoutState.initial()) {
    on<AddItem>((event, emit) {
      final currentState = state;
      if (currentState is CheckoutLoaded) {
        final index = currentState.products.indexWhere(
          (item) => item.product.id == event.product.id,
        );

        final updatedList = [...currentState.products];
        if (index != -1) {
          final updatedItem = updatedList[index]
              .copyWith(quantity: updatedList[index].quantity + 1);
          updatedList[index] = updatedItem;
        } else {
          updatedList.add(ProductQuantity(product: event.product, quantity: 1));
        }

        emit(currentState.copyWith(products: updatedList));
      }
    });

    on<RemoveItem>((event, emit) {
      final currentState = state;
      if (currentState is CheckoutLoaded) {
        final index = currentState.products.indexWhere(
          (item) => item.product.id == event.product.id,
        );

        if (index != -1) {
          final updatedList = [...currentState.products];
          final item = updatedList[index];

          if (item.quantity > 1) {
            updatedList[index] = item.copyWith(quantity: item.quantity - 1);
          } else {
            updatedList.removeAt(index);
          }

          emit(currentState.copyWith(products: updatedList));
        }
      }
    });

    on<ClearCart>((event, emit) {
      final currentState = state;
      if (currentState is CheckoutLoaded) {
        emit(currentState.copyWith(products: []));
      }
    });

    on<AddAddressId>((event, emit) {
      final currentState = state;
      if (currentState is CheckoutLoaded) {
        emit(currentState.copyWith(addressId: event.addressId));
      }
    });

    on<AddPaymentMethod>((event, emit) {
      final currentState = state;
      if (currentState is CheckoutLoaded) {
        emit(currentState.copyWith(
          paymentMethod: event.paymentMethod,
          paymentVaName: event.paymentVaName,
        ));
      }
    });

    on<AddShippingService>((event, emit) {
      final currentState = state;
      if (currentState is CheckoutLoaded) {
        emit(currentState.copyWith(
          shippingService: event.shippingService,
          shippingCost: event.shippingCost,
        ));
      }
    });

    on<UpdateQuantity>((event, emit) {
      final currentState = state;
      if (currentState is CheckoutLoaded) {
        final index = currentState.products.indexWhere(
          (item) => item.product.id == event.product.id,
        );

        if (index != -1) {
          final updatedList = [...currentState.products];
          updatedList[index] =
              updatedList[index].copyWith(quantity: event.quantity);
          emit(currentState.copyWith(products: updatedList));
        }
      }
    });

    on<Started>((event, emit) {
      emit(const CheckoutLoaded([], 0, '', '', '', 0));
    });
  }

  // Method helper untuk membuat API request body
  Map<String, dynamic> toApiRequest() {
    final currentState = state;
    if (currentState is CheckoutLoaded) {
      final totalProductPrice = currentState.products.fold<int>(
        0,
        (total, item) => total + (item.product.price! * item.quantity),
      );
      final totalCost = totalProductPrice + currentState.shippingCost;

      return {
        "address_id": currentState.addressId,
        "payment_method": currentState.paymentMethod,
        "payment_va_name": currentState.paymentVaName,
        "shipping_service": currentState.shippingService,
        "shipping_cost": currentState.shippingCost,
        "total_cost": totalCost,
        "items": currentState.products
            .map((item) => {
                  "product_id": item.product.id,
                  "quantity": item.quantity,
                })
            .toList(),
      };
    }
    return {};
  }
}
