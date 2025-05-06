// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'province_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProvinceEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProvinceEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProvinceEvent()';
  }
}

/// @nodoc
class $ProvinceEventCopyWith<$Res> {
  $ProvinceEventCopyWith(ProvinceEvent _, $Res Function(ProvinceEvent) __);
}

/// @nodoc

class Started implements ProvinceEvent {
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
    return 'ProvinceEvent.started()';
  }
}

/// @nodoc

class GetProvinces implements ProvinceEvent {
  const GetProvinces(this.keyword);

  final String keyword;

  /// Create a copy of ProvinceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetProvincesCopyWith<GetProvinces> get copyWith =>
      _$GetProvincesCopyWithImpl<GetProvinces>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetProvinces &&
            (identical(other.keyword, keyword) || other.keyword == keyword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword);

  @override
  String toString() {
    return 'ProvinceEvent.getProvinces(keyword: $keyword)';
  }
}

/// @nodoc
abstract mixin class $GetProvincesCopyWith<$Res>
    implements $ProvinceEventCopyWith<$Res> {
  factory $GetProvincesCopyWith(
          GetProvinces value, $Res Function(GetProvinces) _then) =
      _$GetProvincesCopyWithImpl;
  @useResult
  $Res call({String keyword});
}

/// @nodoc
class _$GetProvincesCopyWithImpl<$Res> implements $GetProvincesCopyWith<$Res> {
  _$GetProvincesCopyWithImpl(this._self, this._then);

  final GetProvinces _self;
  final $Res Function(GetProvinces) _then;

  /// Create a copy of ProvinceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? keyword = null,
  }) {
    return _then(GetProvinces(
      null == keyword
          ? _self.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$ProvinceState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProvinceState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProvinceState()';
  }
}

/// @nodoc
class $ProvinceStateCopyWith<$Res> {
  $ProvinceStateCopyWith(ProvinceState _, $Res Function(ProvinceState) __);
}

/// @nodoc

class ProvinceInitial implements ProvinceState {
  const ProvinceInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProvinceInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProvinceState.initial()';
  }
}

/// @nodoc

class ProvinceLoading implements ProvinceState {
  const ProvinceLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProvinceLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProvinceState.loading()';
  }
}

/// @nodoc

class ProvinceLoaded implements ProvinceState {
  const ProvinceLoaded(final List<Province> provinces) : _provinces = provinces;

  final List<Province> _provinces;
  List<Province> get provinces {
    if (_provinces is EqualUnmodifiableListView) return _provinces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_provinces);
  }

  /// Create a copy of ProvinceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProvinceLoadedCopyWith<ProvinceLoaded> get copyWith =>
      _$ProvinceLoadedCopyWithImpl<ProvinceLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProvinceLoaded &&
            const DeepCollectionEquality()
                .equals(other._provinces, _provinces));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_provinces));

  @override
  String toString() {
    return 'ProvinceState.loaded(provinces: $provinces)';
  }
}

/// @nodoc
abstract mixin class $ProvinceLoadedCopyWith<$Res>
    implements $ProvinceStateCopyWith<$Res> {
  factory $ProvinceLoadedCopyWith(
          ProvinceLoaded value, $Res Function(ProvinceLoaded) _then) =
      _$ProvinceLoadedCopyWithImpl;
  @useResult
  $Res call({List<Province> provinces});
}

/// @nodoc
class _$ProvinceLoadedCopyWithImpl<$Res>
    implements $ProvinceLoadedCopyWith<$Res> {
  _$ProvinceLoadedCopyWithImpl(this._self, this._then);

  final ProvinceLoaded _self;
  final $Res Function(ProvinceLoaded) _then;

  /// Create a copy of ProvinceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? provinces = null,
  }) {
    return _then(ProvinceLoaded(
      null == provinces
          ? _self._provinces
          : provinces // ignore: cast_nullable_to_non_nullable
              as List<Province>,
    ));
  }
}

/// @nodoc

class ProvinceError implements ProvinceState {
  const ProvinceError(this.message);

  final String message;

  /// Create a copy of ProvinceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProvinceErrorCopyWith<ProvinceError> get copyWith =>
      _$ProvinceErrorCopyWithImpl<ProvinceError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProvinceError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProvinceState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProvinceErrorCopyWith<$Res>
    implements $ProvinceStateCopyWith<$Res> {
  factory $ProvinceErrorCopyWith(
          ProvinceError value, $Res Function(ProvinceError) _then) =
      _$ProvinceErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProvinceErrorCopyWithImpl<$Res>
    implements $ProvinceErrorCopyWith<$Res> {
  _$ProvinceErrorCopyWithImpl(this._self, this._then);

  final ProvinceError _self;
  final $Res Function(ProvinceError) _then;

  /// Create a copy of ProvinceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProvinceError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
