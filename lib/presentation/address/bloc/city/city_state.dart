part of 'city_bloc.dart';

@freezed
class CityState with _$CityState {
  const factory CityState.initial() = CityInitial;
  const factory CityState.loading() = CityLoading;
  const factory CityState.loaded(List<City> cities) = CityLoaded;
  const factory CityState.error(String message) = CityError;
}
