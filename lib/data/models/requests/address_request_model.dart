import 'dart:convert';

class AddressRequestModel {
  final String? name;
  final String? fullAddress;
  final String? phone;
  final String? provId;
  final String? cityId;
  final String? districtId;
  final String? postalCode;
  final bool? isDefault;

  AddressRequestModel({
    this.name,
    this.fullAddress,
    this.phone,
    this.provId,
    this.cityId,
    this.districtId,
    this.postalCode,
    this.isDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'full_address': fullAddress,
      'phone': phone,
      'prov_id': provId,
      'city_id': cityId,
      'district_id': districtId,
      'postal_code': postalCode,
      'is_default': isDefault,
    };
  }

  String toJson() => json.encode(toMap());
}
