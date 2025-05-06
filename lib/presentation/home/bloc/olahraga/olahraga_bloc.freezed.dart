// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'olahraga_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OlahragaEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OlahragaEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OlahragaEvent()';
  }
}

/// @nodoc
class $OlahragaEventCopyWith<$Res> {
  $OlahragaEventCopyWith(OlahragaEvent _, $Res Function(OlahragaEvent) __);
}

/// @nodoc

class Started implements OlahragaEvent {
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
    return 'OlahragaEvent.started()';
  }
}

/// @nodoc

class GetOlahraga implements OlahragaEvent {
  const GetOlahraga();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetOlahraga);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OlahragaEvent.getOlahraga()';
  }
}

/// @nodoc
mixin _$OlahragaState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OlahragaState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OlahragaState()';
  }
}

/// @nodoc
class $OlahragaStateCopyWith<$Res> {
  $OlahragaStateCopyWith(OlahragaState _, $Res Function(OlahragaState) __);
}

/// @nodoc

class OlahragaInitial implements OlahragaState {
  const OlahragaInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OlahragaInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OlahragaState.initial()';
  }
}

/// @nodoc

class OlahragaLoading implements OlahragaState {
  const OlahragaLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OlahragaLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OlahragaState.loading()';
  }
}

/// @nodoc

class OlahragaLoaded implements OlahragaState {
  const OlahragaLoaded(final List<Product> products) : _products = products;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of OlahragaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OlahragaLoadedCopyWith<OlahragaLoaded> get copyWith =>
      _$OlahragaLoadedCopyWithImpl<OlahragaLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OlahragaLoaded &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'OlahragaState.loaded(products: $products)';
  }
}

/// @nodoc
abstract mixin class $OlahragaLoadedCopyWith<$Res>
    implements $OlahragaStateCopyWith<$Res> {
  factory $OlahragaLoadedCopyWith(
          OlahragaLoaded value, $Res Function(OlahragaLoaded) _then) =
      _$OlahragaLoadedCopyWithImpl;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$OlahragaLoadedCopyWithImpl<$Res>
    implements $OlahragaLoadedCopyWith<$Res> {
  _$OlahragaLoadedCopyWithImpl(this._self, this._then);

  final OlahragaLoaded _self;
  final $Res Function(OlahragaLoaded) _then;

  /// Create a copy of OlahragaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(OlahragaLoaded(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class OlahragaError implements OlahragaState {
  const OlahragaError(this.message);

  final String message;

  /// Create a copy of OlahragaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OlahragaErrorCopyWith<OlahragaError> get copyWith =>
      _$OlahragaErrorCopyWithImpl<OlahragaError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OlahragaError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'OlahragaState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $OlahragaErrorCopyWith<$Res>
    implements $OlahragaStateCopyWith<$Res> {
  factory $OlahragaErrorCopyWith(
          OlahragaError value, $Res Function(OlahragaError) _then) =
      _$OlahragaErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$OlahragaErrorCopyWithImpl<$Res>
    implements $OlahragaErrorCopyWith<$Res> {
  _$OlahragaErrorCopyWithImpl(this._self, this._then);

  final OlahragaError _self;
  final $Res Function(OlahragaError) _then;

  /// Create a copy of OlahragaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(OlahragaError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
