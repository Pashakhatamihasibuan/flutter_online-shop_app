part of 'add_address_bloc.dart';

@freezed
class AddAddressState with _$AddAddressState {
  const factory AddAddressState.initial() = AddAddressInitial;
  const factory AddAddressState.loading() = AddAddressLoading;
  const factory AddAddressState.success() = AddAddressSuccess;
  const factory AddAddressState.error(String message) = AddAddressError;
}
