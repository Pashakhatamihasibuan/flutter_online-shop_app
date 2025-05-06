import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/datasources/product_remote_datasource.dart';
import '../../../../data/models/responses/product_response_model.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRemoteDatasource datasource;

  ProductBloc(this.datasource) : super(const ProductState.initial()) {
    // Event: Get all products
    on<Started>((event, emit) async {
      emit(const ProductState.loading());
      final result = await datasource.getAllProduct();
      result.fold(
        (error) => emit(ProductState.error(error)),
        (response) {
          final products = response.data?.data ?? [];
          emit(ProductState.loaded(products));
        },
      );
    });

    // Event: Get products by category
    on<GetProductByCategory>((event, emit) async {
      emit(const ProductState.loading());
      final result = await datasource.getProductByCategory(event.categoryId);
      result.fold(
        (error) => emit(ProductState.error(error)),
        (response) {
          final products = response.data?.data ?? [];
          emit(ProductState.loaded(products));
        },
      );
    });
  }
}
