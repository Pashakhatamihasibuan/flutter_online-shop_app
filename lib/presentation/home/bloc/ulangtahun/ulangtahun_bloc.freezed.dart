// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ulangtahun_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UlangtahunEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UlangtahunEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UlangtahunEvent()';
  }
}

/// @nodoc
class $UlangtahunEventCopyWith<$Res> {
  $UlangtahunEventCopyWith(
      UlangtahunEvent _, $Res Function(UlangtahunEvent) __);
}

/// @nodoc

class Started implements UlangtahunEvent {
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
    return 'UlangtahunEvent.started()';
  }
}

/// @nodoc

class GetUlangtahun implements UlangtahunEvent {
  const GetUlangtahun();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetUlangtahun);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UlangtahunEvent.getUlangtahun()';
  }
}

/// @nodoc
mixin _$UlangtahunState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UlangtahunState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UlangtahunState()';
  }
}

/// @nodoc
class $UlangtahunStateCopyWith<$Res> {
  $UlangtahunStateCopyWith(
      UlangtahunState _, $Res Function(UlangtahunState) __);
}

/// @nodoc

class UlangtahunInitial implements UlangtahunState {
  const UlangtahunInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UlangtahunInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UlangtahunState.initial()';
  }
}

/// @nodoc

class UlangtahunLoading implements UlangtahunState {
  const UlangtahunLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UlangtahunLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'UlangtahunState.loading()';
  }
}

/// @nodoc

class UlangtahunLoaded implements UlangtahunState {
  const UlangtahunLoaded(final List<Product> products) : _products = products;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of UlangtahunState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UlangtahunLoadedCopyWith<UlangtahunLoaded> get copyWith =>
      _$UlangtahunLoadedCopyWithImpl<UlangtahunLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UlangtahunLoaded &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'UlangtahunState.loaded(products: $products)';
  }
}

/// @nodoc
abstract mixin class $UlangtahunLoadedCopyWith<$Res>
    implements $UlangtahunStateCopyWith<$Res> {
  factory $UlangtahunLoadedCopyWith(
          UlangtahunLoaded value, $Res Function(UlangtahunLoaded) _then) =
      _$UlangtahunLoadedCopyWithImpl;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$UlangtahunLoadedCopyWithImpl<$Res>
    implements $UlangtahunLoadedCopyWith<$Res> {
  _$UlangtahunLoadedCopyWithImpl(this._self, this._then);

  final UlangtahunLoaded _self;
  final $Res Function(UlangtahunLoaded) _then;

  /// Create a copy of UlangtahunState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(UlangtahunLoaded(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class UlangtahunError implements UlangtahunState {
  const UlangtahunError(this.message);

  final String message;

  /// Create a copy of UlangtahunState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UlangtahunErrorCopyWith<UlangtahunError> get copyWith =>
      _$UlangtahunErrorCopyWithImpl<UlangtahunError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UlangtahunError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'UlangtahunState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $UlangtahunErrorCopyWith<$Res>
    implements $UlangtahunStateCopyWith<$Res> {
  factory $UlangtahunErrorCopyWith(
          UlangtahunError value, $Res Function(UlangtahunError) _then) =
      _$UlangtahunErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$UlangtahunErrorCopyWithImpl<$Res>
    implements $UlangtahunErrorCopyWith<$Res> {
  _$UlangtahunErrorCopyWithImpl(this._self, this._then);

  final UlangtahunError _self;
  final $Res Function(UlangtahunError) _then;

  /// Create a copy of UlangtahunState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(UlangtahunError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
