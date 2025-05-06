part of 'logout_bloc.dart';

@freezed
class LogoutEvent with _$LogoutEvent {
  const factory LogoutEvent.started() = Started;
  const factory LogoutEvent.logout() = Logout;
}
