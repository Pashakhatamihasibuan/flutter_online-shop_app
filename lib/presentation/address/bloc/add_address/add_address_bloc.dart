import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/address_remote_datasource.dart';
import '../../../../data/models/requests/address_request_model.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';
part 'add_address_bloc.freezed.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final AddressRemoteDataSource addressRemoteDataSource;

  AddAddressBloc(this.addressRemoteDataSource)
      : super(const AddAddressState.initial()) {
    on<AddAddress>((event, emit) async {
      emit(const AddAddressState.loading());
      final response =
          await addressRemoteDataSource.addAddress(event.addressRequestModel);
      response.fold(
        (error) => emit(AddAddressState.error(error)),
        (_) => emit(const AddAddressState.success()),
      );
    });
  }
}
