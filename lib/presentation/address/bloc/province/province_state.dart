part of 'province_bloc.dart';

@freezed
class ProvinceState with _$ProvinceState {
  const factory ProvinceState.initial() = ProvinceInitial;
  const factory ProvinceState.loading() = ProvinceLoading;
  const factory ProvinceState.loaded(List<Province> provinces) = ProvinceLoaded;
  const factory ProvinceState.error(String message) = ProvinceError;
}
