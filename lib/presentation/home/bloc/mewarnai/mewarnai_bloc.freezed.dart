// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mewarnai_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MewarnaiEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MewarnaiEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MewarnaiEvent()';
  }
}

/// @nodoc
class $MewarnaiEventCopyWith<$Res> {
  $MewarnaiEventCopyWith(MewarnaiEvent _, $Res Function(MewarnaiEvent) __);
}

/// @nodoc

class Started implements MewarnaiEvent {
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
    return 'MewarnaiEvent.started()';
  }
}

/// @nodoc

class GetMewarnai implements MewarnaiEvent {
  const GetMewarnai();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetMewarnai);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MewarnaiEvent.getMewarnai()';
  }
}

/// @nodoc
mixin _$MewarnaiState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MewarnaiState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MewarnaiState()';
  }
}

/// @nodoc
class $MewarnaiStateCopyWith<$Res> {
  $MewarnaiStateCopyWith(MewarnaiState _, $Res Function(MewarnaiState) __);
}

/// @nodoc

class MewarnaiInitial implements MewarnaiState {
  const MewarnaiInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MewarnaiInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MewarnaiState.initial()';
  }
}

/// @nodoc

class MewarnaiLoading implements MewarnaiState {
  const MewarnaiLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MewarnaiLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MewarnaiState.loading()';
  }
}

/// @nodoc

class MewarnaiLoaded implements MewarnaiState {
  const MewarnaiLoaded(final List<Product> products) : _products = products;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of MewarnaiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MewarnaiLoadedCopyWith<MewarnaiLoaded> get copyWith =>
      _$MewarnaiLoadedCopyWithImpl<MewarnaiLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MewarnaiLoaded &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'MewarnaiState.loaded(products: $products)';
  }
}

/// @nodoc
abstract mixin class $MewarnaiLoadedCopyWith<$Res>
    implements $MewarnaiStateCopyWith<$Res> {
  factory $MewarnaiLoadedCopyWith(
          MewarnaiLoaded value, $Res Function(MewarnaiLoaded) _then) =
      _$MewarnaiLoadedCopyWithImpl;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$MewarnaiLoadedCopyWithImpl<$Res>
    implements $MewarnaiLoadedCopyWith<$Res> {
  _$MewarnaiLoadedCopyWithImpl(this._self, this._then);

  final MewarnaiLoaded _self;
  final $Res Function(MewarnaiLoaded) _then;

  /// Create a copy of MewarnaiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(MewarnaiLoaded(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class MewarnaiError implements MewarnaiState {
  const MewarnaiError(this.message);

  final String message;

  /// Create a copy of MewarnaiState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MewarnaiErrorCopyWith<MewarnaiError> get copyWith =>
      _$MewarnaiErrorCopyWithImpl<MewarnaiError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MewarnaiError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'MewarnaiState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $MewarnaiErrorCopyWith<$Res>
    implements $MewarnaiStateCopyWith<$Res> {
  factory $MewarnaiErrorCopyWith(
          MewarnaiError value, $Res Function(MewarnaiError) _then) =
      _$MewarnaiErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$MewarnaiErrorCopyWithImpl<$Res>
    implements $MewarnaiErrorCopyWith<$Res> {
  _$MewarnaiErrorCopyWithImpl(this._self, this._then);

  final MewarnaiError _self;
  final $Res Function(MewarnaiError) _then;

  /// Create a copy of MewarnaiState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(MewarnaiError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
