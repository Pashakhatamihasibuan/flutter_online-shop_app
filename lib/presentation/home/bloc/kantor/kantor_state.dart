part of 'kantor_bloc.dart';

@freezed
class KantorState with _$KantorState {
  const factory KantorState.initial() = KantorInitial;
  const factory KantorState.loading() = KantorLoading;
  const factory KantorState.loaded(List<Product> products) = KantorLoaded;
  const factory KantorState.error(String message) = KantorError;
}
