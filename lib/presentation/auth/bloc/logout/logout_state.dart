part of 'logout_bloc.dart';

@freezed
class LogoutState with _$LogoutState {
  const factory LogoutState.initial() = LogoutInitial;
  const factory LogoutState.loading() = LogoutLoading;
  const factory LogoutState.loaded() = LogoutLoaded;
  const factory LogoutState.success() = LogoutSuccess;
  const factory LogoutState.error(String message) = LogoutError;
}
