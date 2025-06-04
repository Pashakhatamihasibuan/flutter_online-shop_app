import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/order_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/order_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/order_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/home/models/product_quantity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_event.dart';
part 'order_state.dart';
part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDatasource datasource;

  OrderBloc(this.datasource) : super(const DoOrderInitial()) {
    on<DoOrder>((event, emit) async {
      print('🚀 OrderBloc: Starting order process...');
      emit(const DoOrderLoading());

      try {
        // Calculate subtotal and total cost
        int subtotal = 0;
        for (var productQuantity in event.products) {
          subtotal +=
              (productQuantity.product.price ?? 0) * productQuantity.quantity;
        }
        int totalCost = subtotal + event.shippingCost;

        print('💰 OrderBloc: Calculated subtotal: $subtotal');
        print('💰 OrderBloc: Calculated total cost: $totalCost');

        final orderRequestData = OrderRequestModel(
          addressId: event.addressId,
          paymentMethod: event.paymentMethod,
          shippingService: event.shippingService,
          shippingCost: event.shippingCost,
          paymentVaName: event.paymentVaName,
          subtotal: subtotal,
          totalCost: totalCost,
          items: event.products
              .map((e) => Item(productId: e.product.id!, quantity: e.quantity))
              .toList(),
        );

        print('📦 OrderBloc: Order request data: ${orderRequestData.toMap()}');

        final response = await datasource.order(orderRequestData);

        print('📡 OrderBloc: Received response from datasource');

        if (response.isLeft()) {
          final failure =
              response.swap().getOrElse(() => 'Unknown error occurred');
          print('❌ OrderBloc: Order failed with error: $failure');
          emit(DoOrderError(failure));
        } else {
          final data = response
              .getOrElse(() => throw Exception('Failed to get order data'));
          print('✅ OrderBloc: Order successful!');
          print('📄 OrderBloc: Order response: ${data.toJson()}');

          // Log specific payment details
          if (data.order != null) {
            print('💳 OrderBloc: Payment method: ${data.order!.paymentMethod}');
            print(
                '🏦 OrderBloc: Payment VA name: ${data.order!.paymentVaName}');
            print(
                '🔢 OrderBloc: Payment VA number: ${data.order!.paymentVaNumber}');
            print(
                '💰 OrderBloc: Total cost from response: ${data.order!.totalCost}');
          } else {
            print('⚠️ OrderBloc: Order data is null in response');
          }

          emit(DoOrderLoaded(data));
        }
      } catch (e, stackTrace) {
        print('💥 OrderBloc: Exception occurred: $e');
        print('📚 OrderBloc: Stack trace: $stackTrace');
        emit(DoOrderError('Unexpected error: ${e.toString()}'));
      }
    });
  }
}
