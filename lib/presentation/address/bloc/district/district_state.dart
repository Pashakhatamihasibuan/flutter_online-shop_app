part of 'district_bloc.dart';

@freezed
class DistrictState with _$DistrictState {
  const factory DistrictState.initial() = DistrictInitial;
  const factory DistrictState.loading() = DistrictLoading;
  const factory DistrictState.loaded(List<District> districts) = DistrictLoaded;
  const factory DistrictState.error(String message) = DistrictError;
}
