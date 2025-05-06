// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'district_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DistrictEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DistrictEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DistrictEvent()';
  }
}

/// @nodoc
class $DistrictEventCopyWith<$Res> {
  $DistrictEventCopyWith(DistrictEvent _, $Res Function(DistrictEvent) __);
}

/// @nodoc

class Started implements DistrictEvent {
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
    return 'DistrictEvent.started()';
  }
}

/// @nodoc

class GetDistrictByRegencyCode implements DistrictEvent {
  const GetDistrictByRegencyCode(this.regencyCode);

  final String regencyCode;

  /// Create a copy of DistrictEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetDistrictByRegencyCodeCopyWith<GetDistrictByRegencyCode> get copyWith =>
      _$GetDistrictByRegencyCodeCopyWithImpl<GetDistrictByRegencyCode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetDistrictByRegencyCode &&
            (identical(other.regencyCode, regencyCode) ||
                other.regencyCode == regencyCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, regencyCode);

  @override
  String toString() {
    return 'DistrictEvent.getDistrictByRegencyCode(regencyCode: $regencyCode)';
  }
}

/// @nodoc
abstract mixin class $GetDistrictByRegencyCodeCopyWith<$Res>
    implements $DistrictEventCopyWith<$Res> {
  factory $GetDistrictByRegencyCodeCopyWith(GetDistrictByRegencyCode value,
          $Res Function(GetDistrictByRegencyCode) _then) =
      _$GetDistrictByRegencyCodeCopyWithImpl;
  @useResult
  $Res call({String regencyCode});
}

/// @nodoc
class _$GetDistrictByRegencyCodeCopyWithImpl<$Res>
    implements $GetDistrictByRegencyCodeCopyWith<$Res> {
  _$GetDistrictByRegencyCodeCopyWithImpl(this._self, this._then);

  final GetDistrictByRegencyCode _self;
  final $Res Function(GetDistrictByRegencyCode) _then;

  /// Create a copy of DistrictEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? regencyCode = null,
  }) {
    return _then(GetDistrictByRegencyCode(
      null == regencyCode
          ? _self.regencyCode
          : regencyCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$DistrictState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DistrictState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DistrictState()';
  }
}

/// @nodoc
class $DistrictStateCopyWith<$Res> {
  $DistrictStateCopyWith(DistrictState _, $Res Function(DistrictState) __);
}

/// @nodoc

class DistrictInitial implements DistrictState {
  const DistrictInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DistrictInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DistrictState.initial()';
  }
}

/// @nodoc

class DistrictLoading implements DistrictState {
  const DistrictLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DistrictLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DistrictState.loading()';
  }
}

/// @nodoc

class DistrictLoaded implements DistrictState {
  const DistrictLoaded(final List<District> districts) : _districts = districts;

  final List<District> _districts;
  List<District> get districts {
    if (_districts is EqualUnmodifiableListView) return _districts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_districts);
  }

  /// Create a copy of DistrictState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DistrictLoadedCopyWith<DistrictLoaded> get copyWith =>
      _$DistrictLoadedCopyWithImpl<DistrictLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DistrictLoaded &&
            const DeepCollectionEquality()
                .equals(other._districts, _districts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_districts));

  @override
  String toString() {
    return 'DistrictState.loaded(districts: $districts)';
  }
}

/// @nodoc
abstract mixin class $DistrictLoadedCopyWith<$Res>
    implements $DistrictStateCopyWith<$Res> {
  factory $DistrictLoadedCopyWith(
          DistrictLoaded value, $Res Function(DistrictLoaded) _then) =
      _$DistrictLoadedCopyWithImpl;
  @useResult
  $Res call({List<District> districts});
}

/// @nodoc
class _$DistrictLoadedCopyWithImpl<$Res>
    implements $DistrictLoadedCopyWith<$Res> {
  _$DistrictLoadedCopyWithImpl(this._self, this._then);

  final DistrictLoaded _self;
  final $Res Function(DistrictLoaded) _then;

  /// Create a copy of DistrictState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? districts = null,
  }) {
    return _then(DistrictLoaded(
      null == districts
          ? _self._districts
          : districts // ignore: cast_nullable_to_non_nullable
              as List<District>,
    ));
  }
}

/// @nodoc

class DistrictError implements DistrictState {
  const DistrictError(this.message);

  final String message;

  /// Create a copy of DistrictState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DistrictErrorCopyWith<DistrictError> get copyWith =>
      _$DistrictErrorCopyWithImpl<DistrictError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DistrictError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'DistrictState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DistrictErrorCopyWith<$Res>
    implements $DistrictStateCopyWith<$Res> {
  factory $DistrictErrorCopyWith(
          DistrictError value, $Res Function(DistrictError) _then) =
      _$DistrictErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DistrictErrorCopyWithImpl<$Res>
    implements $DistrictErrorCopyWith<$Res> {
  _$DistrictErrorCopyWithImpl(this._self, this._then);

  final DistrictError _self;
  final $Res Function(DistrictError) _then;

  /// Create a copy of DistrictState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DistrictError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
