part of 'register_bloc.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState.initial() = RegisterInitial;
  const factory RegisterState.loading() = RegisterLoading;
  const factory RegisterState.success(RegisterResponseModel data) =
      RegisterSuccess;
  const factory RegisterState.error(String message) = RegisterError;
}
