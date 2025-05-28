// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cost_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CostEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CostEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CostEvent()';
  }
}

/// @nodoc
class $CostEventCopyWith<$Res> {
  $CostEventCopyWith(CostEvent _, $Res Function(CostEvent) __);
}

/// @nodoc

class Started implements CostEvent {
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
    return 'CostEvent.started()';
  }
}

/// @nodoc

class GetCost implements CostEvent {
  const GetCost(this.origin, this.destination, this.weight, this.courier);

  final String origin;
  final String destination;
  final String weight;
  final String courier;

  /// Create a copy of CostEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetCostCopyWith<GetCost> get copyWith =>
      _$GetCostCopyWithImpl<GetCost>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetCost &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.courier, courier) || other.courier == courier));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, origin, destination, weight, courier);

  @override
  String toString() {
    return 'CostEvent.getCost(origin: $origin, destination: $destination, weight: $weight, courier: $courier)';
  }
}

/// @nodoc
abstract mixin class $GetCostCopyWith<$Res>
    implements $CostEventCopyWith<$Res> {
  factory $GetCostCopyWith(GetCost value, $Res Function(GetCost) _then) =
      _$GetCostCopyWithImpl;
  @useResult
  $Res call({String origin, String destination, String weight, String courier});
}

/// @nodoc
class _$GetCostCopyWithImpl<$Res> implements $GetCostCopyWith<$Res> {
  _$GetCostCopyWithImpl(this._self, this._then);

  final GetCost _self;
  final $Res Function(GetCost) _then;

  /// Create a copy of CostEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? origin = null,
    Object? destination = null,
    Object? weight = null,
    Object? courier = null,
  }) {
    return _then(GetCost(
      null == origin
          ? _self.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as String,
      null == destination
          ? _self.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as String,
      null == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String,
      null == courier
          ? _self.courier
          : courier // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$CostState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CostState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CostState()';
  }
}

/// @nodoc
class $CostStateCopyWith<$Res> {
  $CostStateCopyWith(CostState _, $Res Function(CostState) __);
}

/// @nodoc

class CostInitial implements CostState {
  const CostInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CostInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CostState.initial()';
  }
}

/// @nodoc

class CostLoading implements CostState {
  const CostLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CostLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CostState.loading()';
  }
}

/// @nodoc

class CostLoaded implements CostState {
  const CostLoaded(this.costResponseModel);

  final CostResponseModel costResponseModel;

  /// Create a copy of CostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CostLoadedCopyWith<CostLoaded> get copyWith =>
      _$CostLoadedCopyWithImpl<CostLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CostLoaded &&
            (identical(other.costResponseModel, costResponseModel) ||
                other.costResponseModel == costResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, costResponseModel);

  @override
  String toString() {
    return 'CostState.loaded(costResponseModel: $costResponseModel)';
  }
}

/// @nodoc
abstract mixin class $CostLoadedCopyWith<$Res>
    implements $CostStateCopyWith<$Res> {
  factory $CostLoadedCopyWith(
          CostLoaded value, $Res Function(CostLoaded) _then) =
      _$CostLoadedCopyWithImpl;
  @useResult
  $Res call({CostResponseModel costResponseModel});
}

/// @nodoc
class _$CostLoadedCopyWithImpl<$Res> implements $CostLoadedCopyWith<$Res> {
  _$CostLoadedCopyWithImpl(this._self, this._then);

  final CostLoaded _self;
  final $Res Function(CostLoaded) _then;

  /// Create a copy of CostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? costResponseModel = null,
  }) {
    return _then(CostLoaded(
      null == costResponseModel
          ? _self.costResponseModel
          : costResponseModel // ignore: cast_nullable_to_non_nullable
              as CostResponseModel,
    ));
  }
}

/// @nodoc

class CostError implements CostState {
  const CostError(this.message);

  final String message;

  /// Create a copy of CostState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CostErrorCopyWith<CostError> get copyWith =>
      _$CostErrorCopyWithImpl<CostError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CostError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CostState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CostErrorCopyWith<$Res>
    implements $CostStateCopyWith<$Res> {
  factory $CostErrorCopyWith(CostError value, $Res Function(CostError) _then) =
      _$CostErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CostErrorCopyWithImpl<$Res> implements $CostErrorCopyWith<$Res> {
  _$CostErrorCopyWithImpl(this._self, this._then);

  final CostError _self;
  final $Res Function(CostError) _then;

  /// Create a copy of CostState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CostError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
