part of 'ulangtahun_bloc.dart';

@freezed
class UlangtahunState with _$UlangtahunState {
  const factory UlangtahunState.initial() = UlangtahunInitial;
  const factory UlangtahunState.loading() = UlangtahunLoading;
  const factory UlangtahunState.loaded(List<Product> products) =
      UlangtahunLoaded;
  const factory UlangtahunState.error(String message) = UlangtahunError;
}
