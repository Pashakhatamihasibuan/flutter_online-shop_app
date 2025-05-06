part of 'register_bloc.dart';

@freezed
class RegisterEvent with _$RegisterEvent {
  const factory RegisterEvent.started() = Started;
  const factory RegisterEvent.submit({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String roles,
  }) = Submit;
}
