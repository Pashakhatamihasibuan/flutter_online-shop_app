part of 'address_bloc.dart';

@freezed
class AddressState with _$AddressState {
  const factory AddressState.initial() = AddressInitial;
  const factory AddressState.loading() = AddressLoading;
  const factory AddressState.loaded(List<Address> addresses) = AddressLoaded;
  const factory AddressState.error(String message) = AddressError;

  const factory AddressState.updated() = AddressUpdated;
}
