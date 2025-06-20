// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatusOrderEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StatusOrderEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StatusOrderEvent()';
  }
}

/// @nodoc
class $StatusOrderEventCopyWith<$Res> {
  $StatusOrderEventCopyWith(
      StatusOrderEvent _, $Res Function(StatusOrderEvent) __);
}

/// @nodoc

class StatusOrderStarted implements StatusOrderEvent {
  const StatusOrderStarted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StatusOrderStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StatusOrderEvent.started()';
  }
}

/// @nodoc

class CheckPaymentStatus implements StatusOrderEvent {
  const CheckPaymentStatus(this.orderId);

  final String orderId;

  /// Create a copy of StatusOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckPaymentStatusCopyWith<CheckPaymentStatus> get copyWith =>
      _$CheckPaymentStatusCopyWithImpl<CheckPaymentStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckPaymentStatus &&
            (identical(other.orderId, orderId) || other.orderId == orderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderId);

  @override
  String toString() {
    return 'StatusOrderEvent.checkPaymentStatus(orderId: $orderId)';
  }
}

/// @nodoc
abstract mixin class $CheckPaymentStatusCopyWith<$Res>
    implements $StatusOrderEventCopyWith<$Res> {
  factory $CheckPaymentStatusCopyWith(
          CheckPaymentStatus value, $Res Function(CheckPaymentStatus) _then) =
      _$CheckPaymentStatusCopyWithImpl;
  @useResult
  $Res call({String orderId});
}

/// @nodoc
class _$CheckPaymentStatusCopyWithImpl<$Res>
    implements $CheckPaymentStatusCopyWith<$Res> {
  _$CheckPaymentStatusCopyWithImpl(this._self, this._then);

  final CheckPaymentStatus _self;
  final $Res Function(CheckPaymentStatus) _then;

  /// Create a copy of StatusOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderId = null,
  }) {
    return _then(CheckPaymentStatus(
      null == orderId
          ? _self.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$StatusOrderState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StatusOrderState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StatusOrderState()';
  }
}

/// @nodoc
class $StatusOrderStateCopyWith<$Res> {
  $StatusOrderStateCopyWith(
      StatusOrderState _, $Res Function(StatusOrderState) __);
}

/// @nodoc

class StatusOrderInitial implements StatusOrderState {
  const StatusOrderInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StatusOrderInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StatusOrderState.initial()';
  }
}

/// @nodoc

class StatusOrderLoading implements StatusOrderState {
  const StatusOrderLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StatusOrderLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'StatusOrderState.loading()';
  }
}

/// @nodoc

class StatusOrderLoaded implements StatusOrderState {
  const StatusOrderLoaded(this.status);

  final String status;

  /// Create a copy of StatusOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatusOrderLoadedCopyWith<StatusOrderLoaded> get copyWith =>
      _$StatusOrderLoadedCopyWithImpl<StatusOrderLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatusOrderLoaded &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'StatusOrderState.loaded(status: $status)';
  }
}

/// @nodoc
abstract mixin class $StatusOrderLoadedCopyWith<$Res>
    implements $StatusOrderStateCopyWith<$Res> {
  factory $StatusOrderLoadedCopyWith(
          StatusOrderLoaded value, $Res Function(StatusOrderLoaded) _then) =
      _$StatusOrderLoadedCopyWithImpl;
  @useResult
  $Res call({String status});
}

/// @nodoc
class _$StatusOrderLoadedCopyWithImpl<$Res>
    implements $StatusOrderLoadedCopyWith<$Res> {
  _$StatusOrderLoadedCopyWithImpl(this._self, this._then);

  final StatusOrderLoaded _self;
  final $Res Function(StatusOrderLoaded) _then;

  /// Create a copy of StatusOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(StatusOrderLoaded(
      null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class StatusOrderError implements StatusOrderState {
  const StatusOrderError(this.message);

  final String message;

  /// Create a copy of StatusOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatusOrderErrorCopyWith<StatusOrderError> get copyWith =>
      _$StatusOrderErrorCopyWithImpl<StatusOrderError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatusOrderError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'StatusOrderState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $StatusOrderErrorCopyWith<$Res>
    implements $StatusOrderStateCopyWith<$Res> {
  factory $StatusOrderErrorCopyWith(
          StatusOrderError value, $Res Function(StatusOrderError) _then) =
      _$StatusOrderErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$StatusOrderErrorCopyWithImpl<$Res>
    implements $StatusOrderErrorCopyWith<$Res> {
  _$StatusOrderErrorCopyWithImpl(this._self, this._then);

  final StatusOrderError _self;
  final $Res Function(StatusOrderError) _then;

  /// Create a copy of StatusOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(StatusOrderError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
