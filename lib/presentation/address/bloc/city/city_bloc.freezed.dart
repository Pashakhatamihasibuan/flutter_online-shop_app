// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CityEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CityEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CityEvent()';
  }
}

/// @nodoc
class $CityEventCopyWith<$Res> {
  $CityEventCopyWith(CityEvent _, $Res Function(CityEvent) __);
}

/// @nodoc

class Started implements CityEvent {
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
    return 'CityEvent.started()';
  }
}

/// @nodoc

class GetCityByProvinceCode implements CityEvent {
  const GetCityByProvinceCode(this.provinceCode);

  final String provinceCode;

  /// Create a copy of CityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetCityByProvinceCodeCopyWith<GetCityByProvinceCode> get copyWith =>
      _$GetCityByProvinceCodeCopyWithImpl<GetCityByProvinceCode>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetCityByProvinceCode &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, provinceCode);

  @override
  String toString() {
    return 'CityEvent.getCityByProvinceCode(provinceCode: $provinceCode)';
  }
}

/// @nodoc
abstract mixin class $GetCityByProvinceCodeCopyWith<$Res>
    implements $CityEventCopyWith<$Res> {
  factory $GetCityByProvinceCodeCopyWith(GetCityByProvinceCode value,
          $Res Function(GetCityByProvinceCode) _then) =
      _$GetCityByProvinceCodeCopyWithImpl;
  @useResult
  $Res call({String provinceCode});
}

/// @nodoc
class _$GetCityByProvinceCodeCopyWithImpl<$Res>
    implements $GetCityByProvinceCodeCopyWith<$Res> {
  _$GetCityByProvinceCodeCopyWithImpl(this._self, this._then);

  final GetCityByProvinceCode _self;
  final $Res Function(GetCityByProvinceCode) _then;

  /// Create a copy of CityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? provinceCode = null,
  }) {
    return _then(GetCityByProvinceCode(
      null == provinceCode
          ? _self.provinceCode
          : provinceCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$CityState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CityState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CityState()';
  }
}

/// @nodoc
class $CityStateCopyWith<$Res> {
  $CityStateCopyWith(CityState _, $Res Function(CityState) __);
}

/// @nodoc

class CityInitial implements CityState {
  const CityInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CityInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CityState.initial()';
  }
}

/// @nodoc

class CityLoading implements CityState {
  const CityLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CityLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CityState.loading()';
  }
}

/// @nodoc

class CityLoaded implements CityState {
  const CityLoaded(final List<City> cities) : _cities = cities;

  final List<City> _cities;
  List<City> get cities {
    if (_cities is EqualUnmodifiableListView) return _cities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cities);
  }

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CityLoadedCopyWith<CityLoaded> get copyWith =>
      _$CityLoadedCopyWithImpl<CityLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CityLoaded &&
            const DeepCollectionEquality().equals(other._cities, _cities));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cities));

  @override
  String toString() {
    return 'CityState.loaded(cities: $cities)';
  }
}

/// @nodoc
abstract mixin class $CityLoadedCopyWith<$Res>
    implements $CityStateCopyWith<$Res> {
  factory $CityLoadedCopyWith(
          CityLoaded value, $Res Function(CityLoaded) _then) =
      _$CityLoadedCopyWithImpl;
  @useResult
  $Res call({List<City> cities});
}

/// @nodoc
class _$CityLoadedCopyWithImpl<$Res> implements $CityLoadedCopyWith<$Res> {
  _$CityLoadedCopyWithImpl(this._self, this._then);

  final CityLoaded _self;
  final $Res Function(CityLoaded) _then;

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? cities = null,
  }) {
    return _then(CityLoaded(
      null == cities
          ? _self._cities
          : cities // ignore: cast_nullable_to_non_nullable
              as List<City>,
    ));
  }
}

/// @nodoc

class CityError implements CityState {
  const CityError(this.message);

  final String message;

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CityErrorCopyWith<CityError> get copyWith =>
      _$CityErrorCopyWithImpl<CityError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CityError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CityState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CityErrorCopyWith<$Res>
    implements $CityStateCopyWith<$Res> {
  factory $CityErrorCopyWith(CityError value, $Res Function(CityError) _then) =
      _$CityErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CityErrorCopyWithImpl<$Res> implements $CityErrorCopyWith<$Res> {
  _$CityErrorCopyWithImpl(this._self, this._then);

  final CityError _self;
  final $Res Function(CityError) _then;

  /// Create a copy of CityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CityError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
