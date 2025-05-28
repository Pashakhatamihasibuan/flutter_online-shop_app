import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_remote_datasource.dart';
import '../../../../data/models/responses/product_response_model.dart';

part 'olahraga_event.dart';
part 'olahraga_state.dart';
part 'olahraga_bloc.freezed.dart';

class OlahragaBloc extends Bloc<OlahragaEvent, OlahragaState> {
  final ProductRemoteDatasource productRemoteDatasource;
  OlahragaBloc(this.productRemoteDatasource) : super(const OlahragaInitial()) {
    on<OlahragaEvent>((event, emit) async {
      emit(const OlahragaLoading());

      final response = await productRemoteDatasource.getProductByCategory(3);
      response.fold(
        (failure) => emit(const OlahragaError('Internal Server Error')),
        (productResponse) =>
            emit(OlahragaLoaded(productResponse.data?.data ?? [])),
      );
    });
  }
}
