import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';

import '../../../../data/datasources/address_remote_datasource.dart';
import '../../../../data/models/requests/address_request_model.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRemoteDatasource addressRemoteDataSource;

  AddressBloc(this.addressRemoteDataSource) : super(const AddressInitial()) {
    on<GetAddress>((event, emit) async {
      emit(const AddressLoading());
      final result = await addressRemoteDataSource.getAddress();
      result.fold(
        (l) => emit(AddressError(l)),
        (r) => emit(AddressLoaded(r.data ?? [])),
      );
    });

    on<UpdateAddress>((event, emit) async {
      emit(const AddressLoading());

      final requestModel = AddressRequestModel(
        name: event.name,
        fullAddress: event.fullAddress,
        postalCode: event.postalCode,
        phone: event.phone,
        provId: event.provId,
        cityId: event.cityId,
        districtId: event.districtId,
      );

      final result =
          await addressRemoteDataSource.updateAddress(event.id, requestModel);
      result.fold(
        (l) => emit(AddressError(l)),
        (r) async {
          final refreshed = await addressRemoteDataSource.getAddress();
          refreshed.fold(
            (l) => emit(AddressError(l)),
            (r) => emit(AddressLoaded(r.data ?? [])),
          );
        },
      );
    });
  }
}
