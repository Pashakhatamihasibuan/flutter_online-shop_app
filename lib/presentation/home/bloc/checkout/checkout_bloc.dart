import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/models/product_quantity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';
part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const CheckoutLoaded([])) {
    on<CheckoutEvent>((event, emit) {
      final currentState = state as CheckoutLoaded;

      if (event is AddItem) {
        final index = currentState.products.indexWhere(
          (item) => item.product.id == event.product.id,
        );

        if (index != -1) {
          // Jika sudah ada, tambah quantity
          final updatedItem = currentState.products[index]
              .copyWith(quantity: currentState.products[index].quantity + 1);
          final updatedList = [...currentState.products];
          updatedList[index] = updatedItem;
          emit(CheckoutLoaded(updatedList));
        } else {
          // Jika belum ada, tambahkan sebagai item baru
          final newItem = ProductQuantity(product: event.product, quantity: 1);
          emit(CheckoutLoaded([...currentState.products, newItem]));
        }
      }

      if (event is RemoveItem) {
        final index = currentState.products.indexWhere(
          (item) => item.product.id == event.product.id,
        );

        if (index != -1) {
          final item = currentState.products[index];
          final updatedList = [...currentState.products];

          if (item.quantity > 1) {
            // Kurangi quantity
            updatedList[index] = item.copyWith(quantity: item.quantity - 1);
          } else {
            // Jika quantity == 1, hapus item dari list
            updatedList.removeAt(index);
          }

          emit(CheckoutLoaded(updatedList));
        }
      }
    });
  }
}
