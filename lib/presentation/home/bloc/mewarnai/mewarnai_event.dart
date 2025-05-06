part of 'mewarnai_bloc.dart';

@freezed
class MewarnaiEvent with _$MewarnaiEvent {
  const factory MewarnaiEvent.started() = Started;
  const factory MewarnaiEvent.getMewarnai() = GetMewarnai;
}
