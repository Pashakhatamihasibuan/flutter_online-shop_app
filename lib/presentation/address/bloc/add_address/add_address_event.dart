part of 'add_address_bloc.dart';

@freezed
class AddAddressEvent with _$AddAddressEvent {
  const factory AddAddressEvent.started() = Started;
  const factory AddAddressEvent.addAddress(
    AddressRequestModel addressRequestModel,
  ) = AddAddress;
}
