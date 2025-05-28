// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CheckoutEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckoutEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutEvent()';
  }
}

/// @nodoc
class $CheckoutEventCopyWith<$Res> {
  $CheckoutEventCopyWith(CheckoutEvent _, $Res Function(CheckoutEvent) __);
}

/// @nodoc

class Started implements CheckoutEvent {
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
    return 'CheckoutEvent.started()';
  }
}

/// @nodoc

class AddItem implements CheckoutEvent {
  const AddItem(this.product);

  final Product product;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddItemCopyWith<AddItem> get copyWith =>
      _$AddItemCopyWithImpl<AddItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddItem &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'CheckoutEvent.addItem(product: $product)';
  }
}

/// @nodoc
abstract mixin class $AddItemCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory $AddItemCopyWith(AddItem value, $Res Function(AddItem) _then) =
      _$AddItemCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class _$AddItemCopyWithImpl<$Res> implements $AddItemCopyWith<$Res> {
  _$AddItemCopyWithImpl(this._self, this._then);

  final AddItem _self;
  final $Res Function(AddItem) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(AddItem(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class RemoveItem implements CheckoutEvent {
  const RemoveItem(this.product);

  final Product product;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RemoveItemCopyWith<RemoveItem> get copyWith =>
      _$RemoveItemCopyWithImpl<RemoveItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RemoveItem &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @override
  String toString() {
    return 'CheckoutEvent.removeItem(product: $product)';
  }
}

/// @nodoc
abstract mixin class $RemoveItemCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory $RemoveItemCopyWith(
          RemoveItem value, $Res Function(RemoveItem) _then) =
      _$RemoveItemCopyWithImpl;
  @useResult
  $Res call({Product product});
}

/// @nodoc
class _$RemoveItemCopyWithImpl<$Res> implements $RemoveItemCopyWith<$Res> {
  _$RemoveItemCopyWithImpl(this._self, this._then);

  final RemoveItem _self;
  final $Res Function(RemoveItem) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
  }) {
    return _then(RemoveItem(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc

class UpdateQuantity implements CheckoutEvent {
  const UpdateQuantity(this.product, this.quantity);

  final Product product;
  final int quantity;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateQuantityCopyWith<UpdateQuantity> get copyWith =>
      _$UpdateQuantityCopyWithImpl<UpdateQuantity>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateQuantity &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  @override
  String toString() {
    return 'CheckoutEvent.updateQuantity(product: $product, quantity: $quantity)';
  }
}

/// @nodoc
abstract mixin class $UpdateQuantityCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory $UpdateQuantityCopyWith(
          UpdateQuantity value, $Res Function(UpdateQuantity) _then) =
      _$UpdateQuantityCopyWithImpl;
  @useResult
  $Res call({Product product, int quantity});
}

/// @nodoc
class _$UpdateQuantityCopyWithImpl<$Res>
    implements $UpdateQuantityCopyWith<$Res> {
  _$UpdateQuantityCopyWithImpl(this._self, this._then);

  final UpdateQuantity _self;
  final $Res Function(UpdateQuantity) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(UpdateQuantity(
      null == product
          ? _self.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == quantity
          ? _self.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class ClearCart implements CheckoutEvent {
  const ClearCart();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearCart);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutEvent.clearCart()';
  }
}

/// @nodoc

class AddAddressId implements CheckoutEvent {
  const AddAddressId(this.addressId);

  final int addressId;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddAddressIdCopyWith<AddAddressId> get copyWith =>
      _$AddAddressIdCopyWithImpl<AddAddressId>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddAddressId &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressId);

  @override
  String toString() {
    return 'CheckoutEvent.addAddressId(addressId: $addressId)';
  }
}

/// @nodoc
abstract mixin class $AddAddressIdCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory $AddAddressIdCopyWith(
          AddAddressId value, $Res Function(AddAddressId) _then) =
      _$AddAddressIdCopyWithImpl;
  @useResult
  $Res call({int addressId});
}

/// @nodoc
class _$AddAddressIdCopyWithImpl<$Res> implements $AddAddressIdCopyWith<$Res> {
  _$AddAddressIdCopyWithImpl(this._self, this._then);

  final AddAddressId _self;
  final $Res Function(AddAddressId) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? addressId = null,
  }) {
    return _then(AddAddressId(
      null == addressId
          ? _self.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class AddPaymentMethod implements CheckoutEvent {
  const AddPaymentMethod(this.paymentMethod, this.paymentVaName);

  final String paymentMethod;
  final String paymentVaName;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddPaymentMethodCopyWith<AddPaymentMethod> get copyWith =>
      _$AddPaymentMethodCopyWithImpl<AddPaymentMethod>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddPaymentMethod &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentVaName, paymentVaName) ||
                other.paymentVaName == paymentVaName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod, paymentVaName);

  @override
  String toString() {
    return 'CheckoutEvent.addPaymentMethod(paymentMethod: $paymentMethod, paymentVaName: $paymentVaName)';
  }
}

/// @nodoc
abstract mixin class $AddPaymentMethodCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory $AddPaymentMethodCopyWith(
          AddPaymentMethod value, $Res Function(AddPaymentMethod) _then) =
      _$AddPaymentMethodCopyWithImpl;
  @useResult
  $Res call({String paymentMethod, String paymentVaName});
}

/// @nodoc
class _$AddPaymentMethodCopyWithImpl<$Res>
    implements $AddPaymentMethodCopyWith<$Res> {
  _$AddPaymentMethodCopyWithImpl(this._self, this._then);

  final AddPaymentMethod _self;
  final $Res Function(AddPaymentMethod) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paymentMethod = null,
    Object? paymentVaName = null,
  }) {
    return _then(AddPaymentMethod(
      null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      null == paymentVaName
          ? _self.paymentVaName
          : paymentVaName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class AddShippingService implements CheckoutEvent {
  const AddShippingService(this.shippingService, this.shippingCost);

  final String shippingService;
  final int shippingCost;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddShippingServiceCopyWith<AddShippingService> get copyWith =>
      _$AddShippingServiceCopyWithImpl<AddShippingService>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddShippingService &&
            (identical(other.shippingService, shippingService) ||
                other.shippingService == shippingService) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost));
  }

  @override
  int get hashCode => Object.hash(runtimeType, shippingService, shippingCost);

  @override
  String toString() {
    return 'CheckoutEvent.addShippingService(shippingService: $shippingService, shippingCost: $shippingCost)';
  }
}

/// @nodoc
abstract mixin class $AddShippingServiceCopyWith<$Res>
    implements $CheckoutEventCopyWith<$Res> {
  factory $AddShippingServiceCopyWith(
          AddShippingService value, $Res Function(AddShippingService) _then) =
      _$AddShippingServiceCopyWithImpl;
  @useResult
  $Res call({String shippingService, int shippingCost});
}

/// @nodoc
class _$AddShippingServiceCopyWithImpl<$Res>
    implements $AddShippingServiceCopyWith<$Res> {
  _$AddShippingServiceCopyWithImpl(this._self, this._then);

  final AddShippingService _self;
  final $Res Function(AddShippingService) _then;

  /// Create a copy of CheckoutEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? shippingService = null,
    Object? shippingCost = null,
  }) {
    return _then(AddShippingService(
      null == shippingService
          ? _self.shippingService
          : shippingService // ignore: cast_nullable_to_non_nullable
              as String,
      null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$CheckoutState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckoutState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState()';
  }
}

/// @nodoc
class $CheckoutStateCopyWith<$Res> {
  $CheckoutStateCopyWith(CheckoutState _, $Res Function(CheckoutState) __);
}

/// @nodoc

class CheckoutInitial implements CheckoutState {
  const CheckoutInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckoutInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState.initial()';
  }
}

/// @nodoc

class CheckoutLoading implements CheckoutState {
  const CheckoutLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CheckoutLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CheckoutState.loading()';
  }
}

/// @nodoc

class CheckoutLoaded implements CheckoutState {
  const CheckoutLoaded(
      final List<ProductQuantity> products,
      this.addressId,
      this.paymentMethod,
      this.paymentVaName,
      this.shippingService,
      this.shippingCost)
      : _products = products;

  final List<ProductQuantity> _products;
  List<ProductQuantity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final int addressId;
  final String paymentMethod;
  final String paymentVaName;
  final String shippingService;
  final int shippingCost;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutLoadedCopyWith<CheckoutLoaded> get copyWith =>
      _$CheckoutLoadedCopyWithImpl<CheckoutLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutLoaded &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentVaName, paymentVaName) ||
                other.paymentVaName == paymentVaName) &&
            (identical(other.shippingService, shippingService) ||
                other.shippingService == shippingService) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      addressId,
      paymentMethod,
      paymentVaName,
      shippingService,
      shippingCost);

  @override
  String toString() {
    return 'CheckoutState.loaded(products: $products, addressId: $addressId, paymentMethod: $paymentMethod, paymentVaName: $paymentVaName, shippingService: $shippingService, shippingCost: $shippingCost)';
  }
}

/// @nodoc
abstract mixin class $CheckoutLoadedCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory $CheckoutLoadedCopyWith(
          CheckoutLoaded value, $Res Function(CheckoutLoaded) _then) =
      _$CheckoutLoadedCopyWithImpl;
  @useResult
  $Res call(
      {List<ProductQuantity> products,
      int addressId,
      String paymentMethod,
      String paymentVaName,
      String shippingService,
      int shippingCost});
}

/// @nodoc
class _$CheckoutLoadedCopyWithImpl<$Res>
    implements $CheckoutLoadedCopyWith<$Res> {
  _$CheckoutLoadedCopyWithImpl(this._self, this._then);

  final CheckoutLoaded _self;
  final $Res Function(CheckoutLoaded) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
    Object? addressId = null,
    Object? paymentMethod = null,
    Object? paymentVaName = null,
    Object? shippingService = null,
    Object? shippingCost = null,
  }) {
    return _then(CheckoutLoaded(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductQuantity>,
      null == addressId
          ? _self.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
      null == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      null == paymentVaName
          ? _self.paymentVaName
          : paymentVaName // ignore: cast_nullable_to_non_nullable
              as String,
      null == shippingService
          ? _self.shippingService
          : shippingService // ignore: cast_nullable_to_non_nullable
              as String,
      null == shippingCost
          ? _self.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class CheckoutError implements CheckoutState {
  const CheckoutError(this.message);

  final String message;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CheckoutErrorCopyWith<CheckoutError> get copyWith =>
      _$CheckoutErrorCopyWithImpl<CheckoutError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CheckoutError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'CheckoutState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $CheckoutErrorCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory $CheckoutErrorCopyWith(
          CheckoutError value, $Res Function(CheckoutError) _then) =
      _$CheckoutErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$CheckoutErrorCopyWithImpl<$Res>
    implements $CheckoutErrorCopyWith<$Res> {
  _$CheckoutErrorCopyWithImpl(this._self, this._then);

  final CheckoutError _self;
  final $Res Function(CheckoutError) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(CheckoutError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
