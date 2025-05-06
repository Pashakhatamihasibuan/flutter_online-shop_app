part of 'district_bloc.dart';

@freezed
class DistrictEvent with _$DistrictEvent {
  const factory DistrictEvent.started() = Started;
  const factory DistrictEvent.getDistrictByRegencyCode(String regencyCode) =
      GetDistrictByRegencyCode;
}
