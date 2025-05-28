class AddressRequestModel {
  final String name;
  final String fullAddress;
  final String postalCode;
  final String phone;
  final String provId;
  final String cityId;
  final int isDefault; // ✅ Tambahkan field ini

  AddressRequestModel({
    required this.name,
    required this.fullAddress,
    required this.postalCode,
    required this.phone,
    required this.provId,
    required this.cityId,
    required this.isDefault, // ✅ Required
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'full_address': fullAddress,
      'postal_code': postalCode,
      'phone': phone,
      'prov_id': provId,
      'city_id': cityId,
      'is_default': isDefault, // ✅ Wajib dikirim ke backend
    };
  }
}
