// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../data/models/responses/product_response_model.dart';

class ProductQuantity {
  Product product;
  int quantity;

  ProductQuantity({required this.product, required this.quantity});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductQuantity &&
        other.product == product &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => product.hashCode ^ quantity.hashCode;

  @override
  String toString() =>
      'ProductQuantity(product: $product, quantity: $quantity)';

  ProductQuantity copyWith({
    Product? product,
    int? quantity,
  }) {
    return ProductQuantity(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }
}
