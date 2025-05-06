// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent()';
  }
}

/// @nodoc
class $LoginEventCopyWith<$Res> {
  $LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}

/// @nodoc

class Started implements LoginEvent {
  const Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.started()';
  }
}

/// @nodoc

class Login implements LoginEvent {
  const Login({required this.email, required this.password});

  final String email;
  final String password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginCopyWith<Login> get copyWith =>
      _$LoginCopyWithImpl<Login>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Login &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @override
  String toString() {
    return 'LoginEvent.login(email: $email, password: $password)';
  }
}

/// @nodoc
abstract mixin class $LoginCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $LoginCopyWith(Login value, $Res Function(Login) _then) =
      _$LoginCopyWithImpl;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginCopyWithImpl<$Res> implements $LoginCopyWith<$Res> {
  _$LoginCopyWithImpl(this._self, this._then);

  final Login _self;
  final $Res Function(Login) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(Login(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$LoginState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState()';
  }
}

/// @nodoc
class $LoginStateCopyWith<$Res> {
  $LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}

/// @nodoc

class LoginInitial implements LoginState {
  const LoginInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.initial()';
  }
}

/// @nodoc

class LoginLoading implements LoginState {
  const LoginLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginState.loading()';
  }
}

/// @nodoc

class LoginLoded implements LoginState {
  const LoginLoded(this.authResponseModel);

  final AuthResponseModel authResponseModel;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginLodedCopyWith<LoginLoded> get copyWith =>
      _$LoginLodedCopyWithImpl<LoginLoded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginLoded &&
            (identical(other.authResponseModel, authResponseModel) ||
                other.authResponseModel == authResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, authResponseModel);

  @override
  String toString() {
    return 'LoginState.loaded(authResponseModel: $authResponseModel)';
  }
}

/// @nodoc
abstract mixin class $LoginLodedCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginLodedCopyWith(
          LoginLoded value, $Res Function(LoginLoded) _then) =
      _$LoginLodedCopyWithImpl;
  @useResult
  $Res call({AuthResponseModel authResponseModel});
}

/// @nodoc
class _$LoginLodedCopyWithImpl<$Res> implements $LoginLodedCopyWith<$Res> {
  _$LoginLodedCopyWithImpl(this._self, this._then);

  final LoginLoded _self;
  final $Res Function(LoginLoded) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? authResponseModel = null,
  }) {
    return _then(LoginLoded(
      null == authResponseModel
          ? _self.authResponseModel
          : authResponseModel // ignore: cast_nullable_to_non_nullable
              as AuthResponseModel,
    ));
  }
}

/// @nodoc

class LoginError implements LoginState {
  const LoginError(this.message);

  final String message;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginErrorCopyWith<LoginError> get copyWith =>
      _$LoginErrorCopyWithImpl<LoginError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'LoginState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $LoginErrorCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory $LoginErrorCopyWith(
          LoginError value, $Res Function(LoginError) _then) =
      _$LoginErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$LoginErrorCopyWithImpl<$Res> implements $LoginErrorCopyWith<$Res> {
  _$LoginErrorCopyWithImpl(this._self, this._then);

  final LoginError _self;
  final $Res Function(LoginError) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(LoginError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
