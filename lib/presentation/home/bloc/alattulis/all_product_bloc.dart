import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_remote_datasource.dart';
import '../../../../data/models/responses/product_response_model.dart';

part 'all_product_event.dart';
part 'all_product_state.dart';
part 'all_product_bloc.freezed.dart';

class AllProductBloc extends Bloc<AllProductEvent, AllProductState> {
  final ProductRemoteDatasource productRemoteDatasource;

  AllProductBloc(this.productRemoteDatasource)
      : super(const AllProductState.initial()) {
    on<GetAllProducts>((event, emit) async {
      emit(const AllProductState.loading());

      final response = await productRemoteDatasource.getAllProduct();
      response.fold(
        (failure) => emit(const AllProductState.error('Internal Server Error')),
        (productResponse) =>
            emit(AllProductState.loaded(productResponse.data?.data ?? [])),
      );
    });
  }
}
