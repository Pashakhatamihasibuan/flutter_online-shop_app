// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddAddressEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddAddressEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAddressEvent()';
  }
}

/// @nodoc
class $AddAddressEventCopyWith<$Res> {
  $AddAddressEventCopyWith(
      AddAddressEvent _, $Res Function(AddAddressEvent) __);
}

/// @nodoc

class Started implements AddAddressEvent {
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
    return 'AddAddressEvent.started()';
  }
}

/// @nodoc

class AddAddress implements AddAddressEvent {
  const AddAddress(this.addressRequestModel);

  final AddressRequestModel addressRequestModel;

  /// Create a copy of AddAddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddAddressCopyWith<AddAddress> get copyWith =>
      _$AddAddressCopyWithImpl<AddAddress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddAddress &&
            (identical(other.addressRequestModel, addressRequestModel) ||
                other.addressRequestModel == addressRequestModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressRequestModel);

  @override
  String toString() {
    return 'AddAddressEvent.addAddress(addressRequestModel: $addressRequestModel)';
  }
}

/// @nodoc
abstract mixin class $AddAddressCopyWith<$Res>
    implements $AddAddressEventCopyWith<$Res> {
  factory $AddAddressCopyWith(
          AddAddress value, $Res Function(AddAddress) _then) =
      _$AddAddressCopyWithImpl;
  @useResult
  $Res call({AddressRequestModel addressRequestModel});
}

/// @nodoc
class _$AddAddressCopyWithImpl<$Res> implements $AddAddressCopyWith<$Res> {
  _$AddAddressCopyWithImpl(this._self, this._then);

  final AddAddress _self;
  final $Res Function(AddAddress) _then;

  /// Create a copy of AddAddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addressRequestModel = null,
  }) {
    return _then(AddAddress(
      null == addressRequestModel
          ? _self.addressRequestModel
          : addressRequestModel // ignore: cast_nullable_to_non_nullable
              as AddressRequestModel,
    ));
  }
}

/// @nodoc
mixin _$AddAddressState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddAddressState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAddressState()';
  }
}

/// @nodoc
class $AddAddressStateCopyWith<$Res> {
  $AddAddressStateCopyWith(
      AddAddressState _, $Res Function(AddAddressState) __);
}

/// @nodoc

class AddAddressInitial implements AddAddressState {
  const AddAddressInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddAddressInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAddressState.initial()';
  }
}

/// @nodoc

class AddAddressLoading implements AddAddressState {
  const AddAddressLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddAddressLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAddressState.loading()';
  }
}

/// @nodoc

class AddAddressSuccess implements AddAddressState {
  const AddAddressSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddAddressSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddAddressState.success()';
  }
}

/// @nodoc

class AddAddressError implements AddAddressState {
  const AddAddressError(this.message);

  final String message;

  /// Create a copy of AddAddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddAddressErrorCopyWith<AddAddressError> get copyWith =>
      _$AddAddressErrorCopyWithImpl<AddAddressError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddAddressError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AddAddressState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AddAddressErrorCopyWith<$Res>
    implements $AddAddressStateCopyWith<$Res> {
  factory $AddAddressErrorCopyWith(
          AddAddressError value, $Res Function(AddAddressError) _then) =
      _$AddAddressErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AddAddressErrorCopyWithImpl<$Res>
    implements $AddAddressErrorCopyWith<$Res> {
  _$AddAddressErrorCopyWithImpl(this._self, this._then);

  final AddAddressError _self;
  final $Res Function(AddAddressError) _then;

  /// Create a copy of AddAddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AddAddressError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
