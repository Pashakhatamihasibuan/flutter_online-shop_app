part of 'kantor_bloc.dart';

@freezed
class KantorEvent with _$KantorEvent {
  const factory KantorEvent.started() = _Started;
  const factory KantorEvent.getKantor() = GetKantor;
}
