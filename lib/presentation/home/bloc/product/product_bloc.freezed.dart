// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductEvent()';
  }
}

/// @nodoc
class $ProductEventCopyWith<$Res> {
  $ProductEventCopyWith(ProductEvent _, $Res Function(ProductEvent) __);
}

/// @nodoc

class Started implements ProductEvent {
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
    return 'ProductEvent.started()';
  }
}

/// @nodoc

class GetProductByCategory implements ProductEvent {
  const GetProductByCategory(this.categoryId);

  final int categoryId;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetProductByCategoryCopyWith<GetProductByCategory> get copyWith =>
      _$GetProductByCategoryCopyWithImpl<GetProductByCategory>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetProductByCategory &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  @override
  String toString() {
    return 'ProductEvent.getProductByCategory(categoryId: $categoryId)';
  }
}

/// @nodoc
abstract mixin class $GetProductByCategoryCopyWith<$Res>
    implements $ProductEventCopyWith<$Res> {
  factory $GetProductByCategoryCopyWith(GetProductByCategory value,
          $Res Function(GetProductByCategory) _then) =
      _$GetProductByCategoryCopyWithImpl;
  @useResult
  $Res call({int categoryId});
}

/// @nodoc
class _$GetProductByCategoryCopyWithImpl<$Res>
    implements $GetProductByCategoryCopyWith<$Res> {
  _$GetProductByCategoryCopyWithImpl(this._self, this._then);

  final GetProductByCategory _self;
  final $Res Function(GetProductByCategory) _then;

  /// Create a copy of ProductEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? categoryId = null,
  }) {
    return _then(GetProductByCategory(
      null == categoryId
          ? _self.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$ProductState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState()';
  }
}

/// @nodoc
class $ProductStateCopyWith<$Res> {
  $ProductStateCopyWith(ProductState _, $Res Function(ProductState) __);
}

/// @nodoc

class ProductInitial implements ProductState {
  const ProductInitial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState.initial()';
  }
}

/// @nodoc

class ProductLoading implements ProductState {
  const ProductLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProductLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProductState.loading()';
  }
}

/// @nodoc

class ProductLoaded implements ProductState {
  const ProductLoaded(final List<Product> products) : _products = products;

  final List<Product> _products;
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductLoadedCopyWith<ProductLoaded> get copyWith =>
      _$ProductLoadedCopyWithImpl<ProductLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductLoaded &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  @override
  String toString() {
    return 'ProductState.loaded(products: $products)';
  }
}

/// @nodoc
abstract mixin class $ProductLoadedCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory $ProductLoadedCopyWith(
          ProductLoaded value, $Res Function(ProductLoaded) _then) =
      _$ProductLoadedCopyWithImpl;
  @useResult
  $Res call({List<Product> products});
}

/// @nodoc
class _$ProductLoadedCopyWithImpl<$Res>
    implements $ProductLoadedCopyWith<$Res> {
  _$ProductLoadedCopyWithImpl(this._self, this._then);

  final ProductLoaded _self;
  final $Res Function(ProductLoaded) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? products = null,
  }) {
    return _then(ProductLoaded(
      null == products
          ? _self._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
    ));
  }
}

/// @nodoc

class ProductError implements ProductState {
  const ProductError(this.message);

  final String message;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProductErrorCopyWith<ProductError> get copyWith =>
      _$ProductErrorCopyWithImpl<ProductError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProductError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ProductState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $ProductErrorCopyWith<$Res>
    implements $ProductStateCopyWith<$Res> {
  factory $ProductErrorCopyWith(
          ProductError value, $Res Function(ProductError) _then) =
      _$ProductErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$ProductErrorCopyWithImpl<$Res> implements $ProductErrorCopyWith<$Res> {
  _$ProductErrorCopyWithImpl(this._self, this._then);

  final ProductError _self;
  final $Res Function(ProductError) _then;

  /// Create a copy of ProductState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(ProductError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
