part of 'olahraga_bloc.dart';

@freezed
class OlahragaState with _$OlahragaState {
  const factory OlahragaState.initial() = OlahragaInitial;
  const factory OlahragaState.loading() = OlahragaLoading;
  const factory OlahragaState.loaded(List<Product> products) = OlahragaLoaded;
  const factory OlahragaState.error(String message) = OlahragaError;
}
