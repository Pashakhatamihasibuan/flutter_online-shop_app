// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OrderEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OrderEvent()';
  }
}

/// @nodoc
class $OrderEventCopyWith<$Res> {
  $OrderEventCopyWith(OrderEvent _, $Res Function(OrderEvent) __);
}

/// @nodoc

class Started implements OrderEvent {
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
    return 'OrderEvent.started()';
  }
}

/// @nodoc

class DoOrder implements OrderEvent {
  const DoOrder(
      {required this.addressId,
      required this.paymentMethod,
      required this.shippingService,
      required this.shippingCost,
      required this.paymentVaName,
      required final List<ProductQuantity> products})
      : _products = products;

  final int addressId;
  final String paymentMethod;
  final String shippingService;
  final int shippingCost;
  final String paymentVaName;
  final List<ProductQuantity> _products;
  List<ProductQuantity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DoOrderCopyWith<DoOrder> get copyWith =>
      _$DoOrderCopyWithImpl<DoOrder>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DoOrder &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.shippingService, shippingService) ||
                other.shippingService == shippingService) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.paymentVaName, paymentVaName) ||
                other.paymentVaName == paymentVaName) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      addressId,
      paymentMethod,
      shippingService,
      shippingCost,
      paymentVaName,
      const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'OrderEvent.doOrder(addressId: $addressId, paymentMethod: $paymentMethod, shippingService: $shippingService, shippingCost: $shippingCost, paymentVaName: $paymentVaName, products: $products)';
  }
}

/// @nodoc
abstract mixin class $DoOrderCopyWith<$Res>
    implements $OrderEventCopyWith<$Res> {
  factory $DoOrderCopyWith(DoOrder value, $Res Function(DoOrder) _then) =
      _$DoOrderCopyWithImpl;
  @useResult
  $Res call(
      {int addressId,
      String paymentMethod,
      String shippingService,
      int shippingCost,
      String paymentVaName,
      List<ProductQuantity> products});
}

/// @nodoc
class _$DoOrderCopyWithImpl<$Res> implements $DoOrderCopyWith<$Res> {
  _$DoOrderCopyWithImpl(this._self, this._then);

  final DoOrder _self;
  final $Res Function(DoOrder) _then;

  /// Create a copy of OrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addressId = null,
    Object? paymentMethod = null,
    Object? shippingService = null,
    Object? shippingCost = null,
    Object? paymentVaName = null,
    Object? products = null,
  }) {
    return _then(DoOrder(
      addressId: null == addressId
          ? _self.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      paymentMethod: null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      shippingService: null == shippingService
          ? _self.shippingService
          : shippingService // ignore: cast_nullable_to_non_nullable
              as String,
      shippingCost: null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as int,
      paymentVaName: null == paymentVaName
          ? _self.paymentVaName
          : paymentVaName // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductQuantity>,
    ));
  }
}

/// @nodoc
mixin _$OrderState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OrderState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OrderState()';
  }
}

/// @nodoc
class $OrderStateCopyWith<$Res> {
  $OrderStateCopyWith(OrderState _, $Res Function(OrderState) __);
}

/// @nodoc

class DoOrderInitial implements OrderState {
  const DoOrderInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DoOrderInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OrderState.initial()';
  }
}

/// @nodoc

class DoOrderLoading implements OrderState {
  const DoOrderLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DoOrderLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OrderState.loading()';
  }
}

/// @nodoc

class DoOrderLoaded implements OrderState {
  const DoOrderLoaded(this.orderResponseModel);

  final OrderResponseModel orderResponseModel;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DoOrderLoadedCopyWith<DoOrderLoaded> get copyWith =>
      _$DoOrderLoadedCopyWithImpl<DoOrderLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DoOrderLoaded &&
            (identical(other.orderResponseModel, orderResponseModel) ||
                other.orderResponseModel == orderResponseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, orderResponseModel);

  @override
  String toString() {
    return 'OrderState.loaded(orderResponseModel: $orderResponseModel)';
  }
}

/// @nodoc
abstract mixin class $DoOrderLoadedCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory $DoOrderLoadedCopyWith(
          DoOrderLoaded value, $Res Function(DoOrderLoaded) _then) =
      _$DoOrderLoadedCopyWithImpl;
  @useResult
  $Res call({OrderResponseModel orderResponseModel});
}

/// @nodoc
class _$DoOrderLoadedCopyWithImpl<$Res>
    implements $DoOrderLoadedCopyWith<$Res> {
  _$DoOrderLoadedCopyWithImpl(this._self, this._then);

  final DoOrderLoaded _self;
  final $Res Function(DoOrderLoaded) _then;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? orderResponseModel = null,
  }) {
    return _then(DoOrderLoaded(
      null == orderResponseModel
          ? _self.orderResponseModel
          : orderResponseModel // ignore: cast_nullable_to_non_nullable
              as OrderResponseModel,
    ));
  }
}

/// @nodoc

class DoOrderError implements OrderState {
  const DoOrderError(this.message);

  final String message;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DoOrderErrorCopyWith<DoOrderError> get copyWith =>
      _$DoOrderErrorCopyWithImpl<DoOrderError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DoOrderError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'OrderState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $DoOrderErrorCopyWith<$Res>
    implements $OrderStateCopyWith<$Res> {
  factory $DoOrderErrorCopyWith(
          DoOrderError value, $Res Function(DoOrderError) _then) =
      _$DoOrderErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$DoOrderErrorCopyWithImpl<$Res> implements $DoOrderErrorCopyWith<$Res> {
  _$DoOrderErrorCopyWithImpl(this._self, this._then);

  final DoOrderError _self;
  final $Res Function(DoOrderError) _then;

  /// Create a copy of OrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(DoOrderError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
