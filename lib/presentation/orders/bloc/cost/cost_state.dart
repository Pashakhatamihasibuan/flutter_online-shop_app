part of 'cost_bloc.dart';

@freezed
class CostState with _$CostState {
  const factory CostState.initial() = CostInitial;
  const factory CostState.loading() = CostLoading;
  const factory CostState.loaded(CostResponseModel costResponseModel) =
      CostLoaded;
  const factory CostState.error(String message) = CostError;
}
