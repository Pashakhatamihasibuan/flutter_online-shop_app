part of 'mewarnai_bloc.dart';

@freezed
class MewarnaiState with _$MewarnaiState {
  const factory MewarnaiState.initial() = MewarnaiInitial;
  const factory MewarnaiState.loading() = MewarnaiLoading;
  const factory MewarnaiState.loaded(List<Product> products) = MewarnaiLoaded;
  const factory MewarnaiState.error(String message) = MewarnaiError;
}
