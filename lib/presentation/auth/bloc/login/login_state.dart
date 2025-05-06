part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = LoginInitial;
  const factory LoginState.loading() = LoginLoading;
  const factory LoginState.loaded(AuthResponseModel authResponseModel) =
      LoginLoded;
  const factory LoginState.error(String message) = LoginError;
}
