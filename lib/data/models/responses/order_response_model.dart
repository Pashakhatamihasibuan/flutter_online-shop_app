// Pastikan model Order Anda memiliki field untuk VA number
// Contoh struktur yang benar:

import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';

class OrderResponseModel {
  final bool? success;
  final String? message;
  final Order? order;

  OrderResponseModel({
    this.success,
    this.message,
    this.order,
  });

  factory OrderResponseModel.fromJson(Map<String, dynamic> json) =>
      OrderResponseModel(
        success: json["success"],
        message: json["message"],
        order: json["order"] == null ? null : Order.fromJson(json["order"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "order": order?.toJson(),
      };
}

class Order {
  final int? id;
  final int? addressId;
  final String? paymentMethod;
  final String? paymentVaName; // Field untuk nama bank VA
  final String? paymentVaNumber; // Field untuk nomor VA
  final String? shippingService;
  final int? shippingCost;
  final int? subtotal;
  final int? totalCost;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<OrderItem>? items;

  Order({
    this.id,
    this.addressId,
    this.paymentMethod,
    this.paymentVaName,
    this.paymentVaNumber,
    this.shippingService,
    this.shippingCost,
    this.subtotal,
    this.totalCost,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    print('🔍 Order.fromJson: Processing JSON: $json');

    return Order(
      id: json["id"],
      addressId: json["address_id"],
      paymentMethod: json["payment_method"],
      paymentVaName:
          json["payment_va_name"] ?? json["va_name"] ?? json["bank_code"],
      paymentVaNumber: json["payment_va_number"] ??
          json["va_number"] ??
          json["virtual_account_number"],
      shippingService: json["shipping_service"],
      shippingCost: json["shipping_cost"],
      subtotal: json["subtotal"],
      totalCost: json["total_cost"],
      status: json["status"],
      createdAt: json["created_at"] == null
          ? null
          : DateTime.parse(json["created_at"]),
      updatedAt: json["updated_at"] == null
          ? null
          : DateTime.parse(json["updated_at"]),
      items: json["items"] == null
          ? []
          : List<OrderItem>.from(
              json["items"]!.map((x) => OrderItem.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "address_id": addressId,
        "payment_method": paymentMethod,
        "payment_va_name": paymentVaName,
        "payment_va_number": paymentVaNumber,
        "shipping_service": shippingService,
        "shipping_cost": shippingCost,
        "subtotal": subtotal,
        "total_cost": totalCost,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}

class OrderItem {
  final int? id;
  final int? orderId;
  final int? productId;
  final int? quantity;
  final Product? product;

  OrderItem({
    this.id,
    this.orderId,
    this.productId,
    this.quantity,
    this.product,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        id: json["id"],
        orderId: json["order_id"],
        productId: json["product_id"],
        quantity: json["quantity"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "product": product?.toJson(),
      };
}

// Contoh response JSON yang diharapkan dari API:
/*
{
  "success": true,
  "message": "Order created successfully",
  "order": {
    "id": 123,
    "address_id": 1,
    "payment_method": "bank_transfer",
    "payment_va_name": "bca",
    "payment_va_number": "8012345678901234",
    "shipping_service": "JNE",
    "shipping_cost": 15000,
    "subtotal": 100000,
    "total_cost": 115000,
    "status": "pending",
    "created_at": "2024-01-01T10:00:00Z",
    "updated_at": "2024-01-01T10:00:00Z",
    "items": [...]
  }
}
*/
