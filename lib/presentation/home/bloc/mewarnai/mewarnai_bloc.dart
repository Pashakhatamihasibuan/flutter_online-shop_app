import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_remote_datasource.dart';
import '../../../../data/models/responses/product_response_model.dart';

part 'mewarnai_event.dart';
part 'mewarnai_state.dart';
part 'mewarnai_bloc.freezed.dart';

class MewarnaiBloc extends Bloc<MewarnaiEvent, MewarnaiState> {
  final ProductRemoteDatasource productRemoteDatasource;
  MewarnaiBloc(this.productRemoteDatasource) : super(const MewarnaiInitial()) {
    on<MewarnaiEvent>((event, emit) async {
      emit(const MewarnaiLoading());

      final response = await productRemoteDatasource.getProductByCategory(6);
      response.fold(
        (failure) => emit(const MewarnaiError('Internal Server Error')),
        (productResponse) =>
            emit(MewarnaiLoaded(productResponse.data?.data ?? [])),
      );
    });
  }
}
