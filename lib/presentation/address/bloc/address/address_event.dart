part of 'address_bloc.dart';

@freezed
class AddressEvent with _$AddressEvent {
  const factory AddressEvent.started() = Started;
  const factory AddressEvent.getAddress() = GetAddress;
  const factory AddressEvent.updateAddress({
    required int id,
    required String name,
    required String fullAddress,
    required String postalCode,
    required String phone,
    required String provId,
    required String cityId,
    required String districtId,
  }) = UpdateAddress;
}
