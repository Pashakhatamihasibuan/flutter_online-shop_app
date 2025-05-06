// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kantor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$KantorEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is KantorEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'KantorEvent()';
  }
}

/// @nodoc
class $KantorEventCopyWith<$Res> {
  $KantorEventCopyWith(KantorEvent _, $Res Function(KantorEvent) __);
}

/// @nodoc

class _Started implements KantorEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'KantorEvent.started()';
  }
}

/// @nodoc

class GetKantor implements KantorEvent {
  const GetKantor();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GetKantor);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'KantorEvent.getKantor()';
  }
}

/// @nodoc
mixin _$KantorState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is KantorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'KantorState()';
  }
}

/// @nodoc
class $KantorStateCopyWith<$Res> {
  $KantorStateCopyWith(KantorState _, $Res Function(KantorState) __);
}

/// @nodoc

class KantorInitial implements KantorState {
  const KantorInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is KantorInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'KantorState.initial()';
  }
}

/// @nodoc

class KantorLoading implements KantorState {
  const KantorLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is KantorLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'KantorState.loading()';
  }
}

/// @nodoc

class KantorLoaded implements KantorState {
  const KantorLoaded(final List<Product> products) : _products = products;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of KantorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KantorLoadedCopyWith<KantorLoaded> get copyWith =>
      _$KantorLoadedCopyWithImpl<KantorLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KantorLoaded &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'KantorState.loaded(products: $products)';
  }
}

/// @nodoc
abstract mixin class $KantorLoadedCopyWith<$Res>
    implements $KantorStateCopyWith<$Res> {
  factory $KantorLoadedCopyWith(
          KantorLoaded value, $Res Function(KantorLoaded) _then) =
      _$KantorLoadedCopyWithImpl;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$KantorLoadedCopyWithImpl<$Res> implements $KantorLoadedCopyWith<$Res> {
  _$KantorLoadedCopyWithImpl(this._self, this._then);

  final KantorLoaded _self;
  final $Res Function(KantorLoaded) _then;

  /// Create a copy of KantorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(KantorLoaded(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class KantorError implements KantorState {
  const KantorError(this.message);

  final String message;

  /// Create a copy of KantorState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $KantorErrorCopyWith<KantorError> get copyWith =>
      _$KantorErrorCopyWithImpl<KantorError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is KantorError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'KantorState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $KantorErrorCopyWith<$Res>
    implements $KantorStateCopyWith<$Res> {
  factory $KantorErrorCopyWith(
          KantorError value, $Res Function(KantorError) _then) =
      _$KantorErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$KantorErrorCopyWithImpl<$Res> implements $KantorErrorCopyWith<$Res> {
  _$KantorErrorCopyWithImpl(this._self, this._then);

  final KantorError _self;
  final $Res Function(KantorError) _then;

  /// Create a copy of KantorState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(KantorError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
