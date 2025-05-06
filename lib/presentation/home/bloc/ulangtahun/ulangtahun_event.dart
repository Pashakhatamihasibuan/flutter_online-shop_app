part of 'ulangtahun_bloc.dart';

@freezed
class UlangtahunEvent with _$UlangtahunEvent {
  const factory UlangtahunEvent.started() = Started;
  const factory UlangtahunEvent.getUlangtahun() = GetUlangtahun;
}
