// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddressEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddressEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressEvent()';
  }
}

/// @nodoc
class $AddressEventCopyWith<$Res> {
  $AddressEventCopyWith(AddressEvent _, $Res Function(AddressEvent) __);
}

/// @nodoc

class Started implements AddressEvent {
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
    return 'AddressEvent.started()';
  }
}

/// @nodoc

class GetAddress implements AddressEvent {
  const GetAddress();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetAddress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressEvent.getAddress()';
  }
}

/// @nodoc

class UpdateAddress implements AddressEvent {
  const UpdateAddress(
      {required this.id,
      required this.name,
      required this.fullAddress,
      required this.postalCode,
      required this.phone,
      required this.provId,
      required this.cityId,
      required this.districtId});

  final int id;
  final String name;
  final String fullAddress;
  final String postalCode;
  final String phone;
  final String provId;
  final String cityId;
  final String districtId;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateAddressCopyWith<UpdateAddress> get copyWith =>
      _$UpdateAddressCopyWithImpl<UpdateAddress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateAddress &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.provId, provId) || other.provId == provId) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.districtId, districtId) ||
                other.districtId == districtId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, fullAddress,
      postalCode, phone, provId, cityId, districtId);

  @override
  String toString() {
    return 'AddressEvent.updateAddress(id: $id, name: $name, fullAddress: $fullAddress, postalCode: $postalCode, phone: $phone, provId: $provId, cityId: $cityId, districtId: $districtId)';
  }
}

/// @nodoc
abstract mixin class $UpdateAddressCopyWith<$Res>
    implements $AddressEventCopyWith<$Res> {
  factory $UpdateAddressCopyWith(
          UpdateAddress value, $Res Function(UpdateAddress) _then) =
      _$UpdateAddressCopyWithImpl;
  @useResult
  $Res call(
      {int id,
      String name,
      String fullAddress,
      String postalCode,
      String phone,
      String provId,
      String cityId,
      String districtId});
}

/// @nodoc
class _$UpdateAddressCopyWithImpl<$Res>
    implements $UpdateAddressCopyWith<$Res> {
  _$UpdateAddressCopyWithImpl(this._self, this._then);

  final UpdateAddress _self;
  final $Res Function(UpdateAddress) _then;

  /// Create a copy of AddressEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? fullAddress = null,
    Object? postalCode = null,
    Object? phone = null,
    Object? provId = null,
    Object? cityId = null,
    Object? districtId = null,
  }) {
    return _then(UpdateAddress(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fullAddress: null == fullAddress
          ? _self.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _self.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _self.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      provId: null == provId
          ? _self.provId
          : provId // ignore: cast_nullable_to_non_nullable
              as String,
      cityId: null == cityId
          ? _self.cityId
          : cityId // ignore: cast_nullable_to_non_nullable
              as String,
      districtId: null == districtId
          ? _self.districtId
          : districtId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AddressState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddressState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressState()';
  }
}

/// @nodoc
class $AddressStateCopyWith<$Res> {
  $AddressStateCopyWith(AddressState _, $Res Function(AddressState) __);
}

/// @nodoc

class AddressInitial implements AddressState {
  const AddressInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddressInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressState.initial()';
  }
}

/// @nodoc

class AddressLoading implements AddressState {
  const AddressLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AddressLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AddressState.loading()';
  }
}

/// @nodoc

class AddressLoaded implements AddressState {
  const AddressLoaded(final List<Address> addresses) : _addresses = addresses;

  final List<Address> _addresses;
  List<Address> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressLoadedCopyWith<AddressLoaded> get copyWith =>
      _$AddressLoadedCopyWithImpl<AddressLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressLoaded &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_addresses));

  @override
  String toString() {
    return 'AddressState.loaded(addresses: $addresses)';
  }
}

/// @nodoc
abstract mixin class $AddressLoadedCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory $AddressLoadedCopyWith(
          AddressLoaded value, $Res Function(AddressLoaded) _then) =
      _$AddressLoadedCopyWithImpl;
  @useResult
  $Res call({List<Address> addresses});
}

/// @nodoc
class _$AddressLoadedCopyWithImpl<$Res>
    implements $AddressLoadedCopyWith<$Res> {
  _$AddressLoadedCopyWithImpl(this._self, this._then);

  final AddressLoaded _self;
  final $Res Function(AddressLoaded) _then;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addresses = null,
  }) {
    return _then(AddressLoaded(
      null == addresses
          ? _self._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<Address>,
    ));
  }
}

/// @nodoc

class AddressError implements AddressState {
  const AddressError(this.message);

  final String message;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddressErrorCopyWith<AddressError> get copyWith =>
      _$AddressErrorCopyWithImpl<AddressError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddressError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'AddressState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $AddressErrorCopyWith<$Res>
    implements $AddressStateCopyWith<$Res> {
  factory $AddressErrorCopyWith(
          AddressError value, $Res Function(AddressError) _then) =
      _$AddressErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$AddressErrorCopyWithImpl<$Res> implements $AddressErrorCopyWith<$Res> {
  _$AddressErrorCopyWithImpl(this._self, this._then);

  final AddressError _self;
  final $Res Function(AddressError) _then;

  /// Create a copy of AddressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(AddressError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
