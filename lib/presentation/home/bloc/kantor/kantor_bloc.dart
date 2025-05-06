import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/product_remote_datasource.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/models/responses/product_response_model.dart';

part 'kantor_event.dart';
part 'kantor_state.dart';
part 'kantor_bloc.freezed.dart';

class KantorBloc extends Bloc<KantorEvent, KantorState> {
  final ProductRemoteDatasource productRemoteDatasource;
  KantorBloc(this.productRemoteDatasource) : super(const KantorInitial()) {
    on<KantorEvent>((event, emit) async {
      emit(const KantorLoading());

      final response = await productRemoteDatasource.getProductByCategory(7);
      response.fold(
        (failure) => emit(const KantorError('Internal Server Error')),
        (productResponse) =>
            emit(KantorLoaded(productResponse.data?.data ?? [])),
      );
    });
  }
}
