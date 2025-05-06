part of 'olahraga_bloc.dart';

@freezed
class OlahragaEvent with _$OlahragaEvent {
  const factory OlahragaEvent.started() = Started;
  const factory OlahragaEvent.getOlahraga() = GetOlahraga;
}
