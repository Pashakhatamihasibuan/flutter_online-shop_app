import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_remote_datasource.dart';
import '../../../../data/models/responses/product_response_model.dart';

part 'ulangtahun_event.dart';
part 'ulangtahun_state.dart';
part 'ulangtahun_bloc.freezed.dart';

class UlangtahunBloc extends Bloc<UlangtahunEvent, UlangtahunState> {
  final ProductRemoteDatasource productRemoteDatasource;
  UlangtahunBloc(this.productRemoteDatasource)
      : super(const UlangtahunInitial()) {
    on<UlangtahunEvent>((event, emit) async {
      emit(const UlangtahunLoading());

      final response = await productRemoteDatasource.getProductByCategory(7);
      response.fold(
        (failure) => emit(const UlangtahunError('Internal Server Error')),
        (productResponse) =>
            emit(UlangtahunLoaded(productResponse.data?.data ?? [])),
      );
    });
  }
}
