part of 'city_bloc.dart';

@freezed
class CityEvent with _$CityEvent {
  const factory CityEvent.started() = Started;
  const factory CityEvent.getCityByProvinceCode(String provinceCode) =
      GetCityByProvinceCode;
}
