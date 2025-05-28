import 'package:bloc/bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/address_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/requests/address_request_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';

part 'address_bloc.freezed.dart';
part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends Bloc<AddressEvent, AddressState> {
  final AddressRemoteDataSource addressRemoteDataSource;

  AddressBloc(this.addressRemoteDataSource) : super(const AddressInitial()) {
    on<GetAddresses>(_onGetAddresses);
    on<UpdateAddresses>(_onUpdateAddresses);
  }

  Future<void> _onGetAddresses(
    GetAddresses event,
    Emitter<AddressState> emit,
  ) async {
    emit(const AddressLoading());
    final result = await addressRemoteDataSource.getAddresses();
    result.fold(
      (l) {
        print('❌ GET ADDRESSES ERROR: $l');
        emit(AddressError(l));
      },
      (r) {
        print('📥 GET ADDRESSES SUCCESS: ${r.data}');
        emit(AddressLoaded(r.data ?? []));
      },
    );
  }

  Future<void> _onUpdateAddresses(
    UpdateAddresses event,
    Emitter<AddressState> emit,
  ) async {
    try {
      // Emit loading state only if not already loading
      if (state is! AddressLoading) {
        emit(const AddressLoading());
      }

      final requestModel = AddressRequestModel(
        name: event.name,
        fullAddress: event.fullAddress,
        postalCode: event.postalCode,
        phone: event.phone,
        provId: event.provId,
        cityId: event.cityId,
        isDefault: event.isDefault,
      );

      final updateResult = await addressRemoteDataSource.updateAddresses(
        event.id,
        requestModel,
      );

      updateResult.fold(
        (failure) {
          print('❌ UPDATE ADDRESS ERROR: $failure');
          emit(AddressError(failure));
        },
        (success) {
          print('✅ UPDATE ADDRESS SUCCESS: $success');
          emit(const AddressUpdated());
        },
      );

      // Only proceed to refresh if the update was successful
      if (updateResult.isRight()) {
        final refreshResult = await addressRemoteDataSource.getAddresses();
        refreshResult.fold(
          (failure) {
            print('❌ REFRESH ERROR AFTER UPDATE: $failure');
            emit(AddressError(failure));
          },
          (addresses) {
            print('📦 REFRESHED ADDRESS DATA: ${addresses.data}');
            emit(AddressLoaded(addresses.data ?? []));
          },
        );
      }
    } catch (e) {
      print('❌ EXCEPTION: $e');
      emit(AddressError(e.toString()));
    }
  }
}
