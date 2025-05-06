// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterEvent()';
  }
}

/// @nodoc
class $RegisterEventCopyWith<$Res> {
  $RegisterEventCopyWith(RegisterEvent _, $Res Function(RegisterEvent) __);
}

/// @nodoc

class Started implements RegisterEvent {
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
    return 'RegisterEvent.started()';
  }
}

/// @nodoc

class Submit implements RegisterEvent {
  const Submit(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.roles});

  final String name;
  final String email;
  final String password;
  final String phone;
  final String roles;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubmitCopyWith<Submit> get copyWith =>
      _$SubmitCopyWithImpl<Submit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Submit &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.roles, roles) || other.roles == roles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, password, phone, roles);

  @override
  String toString() {
    return 'RegisterEvent.submit(name: $name, email: $email, password: $password, phone: $phone, roles: $roles)';
  }
}

/// @nodoc
abstract mixin class $SubmitCopyWith<$Res>
    implements $RegisterEventCopyWith<$Res> {
  factory $SubmitCopyWith(Submit value, $Res Function(Submit) _then) =
      _$SubmitCopyWithImpl;
  @useResult
  $Res call(
      {String name, String email, String password, String phone, String roles});
}

/// @nodoc
class _$SubmitCopyWithImpl<$Res> implements $SubmitCopyWith<$Res> {
  _$SubmitCopyWithImpl(this._self, this._then);

  final Submit _self;
  final $Res Function(Submit) _then;

  /// Create a copy of RegisterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? password = null,
    Object? phone = null,
    Object? roles = null,
  }) {
    return _then(Submit(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      roles: null == roles
          ? _self.roles
          : roles // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$RegisterState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState()';
  }
}

/// @nodoc
class $RegisterStateCopyWith<$Res> {
  $RegisterStateCopyWith(RegisterState _, $Res Function(RegisterState) __);
}

/// @nodoc

class RegisterInitial implements RegisterState {
  const RegisterInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.initial()';
  }
}

/// @nodoc

class RegisterLoading implements RegisterState {
  const RegisterLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RegisterLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'RegisterState.loading()';
  }
}

/// @nodoc

class RegisterSuccess implements RegisterState {
  const RegisterSuccess(this.data);

  final RegisterResponseModel data;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterSuccessCopyWith<RegisterSuccess> get copyWith =>
      _$RegisterSuccessCopyWithImpl<RegisterSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterSuccess &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'RegisterState.success(data: $data)';
  }
}

/// @nodoc
abstract mixin class $RegisterSuccessCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory $RegisterSuccessCopyWith(
          RegisterSuccess value, $Res Function(RegisterSuccess) _then) =
      _$RegisterSuccessCopyWithImpl;
  @useResult
  $Res call({RegisterResponseModel data});
}

/// @nodoc
class _$RegisterSuccessCopyWithImpl<$Res>
    implements $RegisterSuccessCopyWith<$Res> {
  _$RegisterSuccessCopyWithImpl(this._self, this._then);

  final RegisterSuccess _self;
  final $Res Function(RegisterSuccess) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(RegisterSuccess(
      null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as RegisterResponseModel,
    ));
  }
}

/// @nodoc

class RegisterError implements RegisterState {
  const RegisterError(this.message);

  final String message;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterErrorCopyWith<RegisterError> get copyWith =>
      _$RegisterErrorCopyWithImpl<RegisterError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'RegisterState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $RegisterErrorCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory $RegisterErrorCopyWith(
          RegisterError value, $Res Function(RegisterError) _then) =
      _$RegisterErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$RegisterErrorCopyWithImpl<$Res>
    implements $RegisterErrorCopyWith<$Res> {
  _$RegisterErrorCopyWithImpl(this._self, this._then);

  final RegisterError _self;
  final $Res Function(RegisterError) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(RegisterError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
