part of 'cost_bloc.dart';

@freezed
class CostEvent with _$CostEvent {
  const factory CostEvent.started() = Started;
  const factory CostEvent.getCost(
    String origin,
    String destination,
    String weight,
    String courier,
  ) = GetCost;
}
