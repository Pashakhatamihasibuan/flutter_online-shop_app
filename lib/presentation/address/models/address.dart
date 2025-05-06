class Address {
  final String firstName;
  final String address;
  final String cityCode;
  final String cityName;
  final String provinceCode;
  final String provinceName;
  final String districtCode;
  final String districtName;
  final int zipCode;
  final String phoneNumber;
  final int isPrimary; // 1 = true, 0 = false

  Address({
    required this.firstName,
    required this.address,
    required this.cityCode,
    required this.cityName,
    required this.provinceCode,
    required this.provinceName,
    required this.districtCode,
    required this.districtName,
    required this.zipCode,
    required this.phoneNumber,
    this.isPrimary = 0,
  });
}
