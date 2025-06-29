import 'dart:convert';

class OrderStatusResponseModel {
  final bool success;
  final OrderStatusData? data;
  final String? message;

  OrderStatusResponseModel({
    required this.success,
    this.data,
    this.message,
  });

  factory OrderStatusResponseModel.fromJson(String str) =>
      OrderStatusResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderStatusResponseModel.fromMap(Map<String, dynamic> json) =>
      OrderStatusResponseModel(
        success: json["success"] ?? false,
        data:
            json["data"] != null ? OrderStatusData.fromMap(json["data"]) : null,
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "data": data?.toMap(),
        "message": message,
      };
}

class OrderStatusData {
  final int orderId;
  final String transactionNumber;
  final String status;
  final String paymentStatus;
  final String paymentMethod;
  final String paymentVaNumber;
  final int subtotal;
  final int shippingCost;
  final int totalCost;
  final String shippingService;
  final String createdAt;
  final String updatedAt;
  final List<OrderItemData> items;

  OrderStatusData({
    required this.orderId,
    required this.transactionNumber,
    required this.status,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.paymentVaNumber,
    required this.subtotal,
    required this.shippingCost,
    required this.totalCost,
    required this.shippingService,
    required this.createdAt,
    required this.updatedAt,
    required this.items,
  });

  factory OrderStatusData.fromJson(String str) =>
      OrderStatusData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderStatusData.fromMap(Map<String, dynamic> json) => OrderStatusData(
        orderId: json["order_id"] ?? 0,
        transactionNumber: json["transaction_number"] ?? '',
        status: json["status"] ?? 'pending',
        paymentStatus: json["payment_status"] ?? 'pending',
        paymentMethod: json["payment_method"] ?? '',
        paymentVaNumber: json["payment_va_number"] ?? '',
        subtotal: json["subtotal"] ?? 0,
        shippingCost: json["shipping_cost"] ?? 0,
        totalCost: json["total_cost"] ?? 0,
        shippingService: json["shipping_service"] ?? '',
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        items: json["items"] == null
            ? []
            : List<OrderItemData>.from(
                json["items"].map((x) => OrderItemData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "order_id": orderId,
        "transaction_number": transactionNumber,
        "status": status,
        "payment_status": paymentStatus,
        "payment_method": paymentMethod,
        "payment_va_number": paymentVaNumber,
        "subtotal": subtotal,
        "shipping_cost": shippingCost,
        "total_cost": totalCost,
        "shipping_service": shippingService,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class OrderItemData {
  final int id;
  final int orderId;
  final int productId;
  final int quantity;
  final String createdAt;
  final String updatedAt;
  final ProductData? product;

  OrderItemData({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    this.product,
  });

  factory OrderItemData.fromJson(String str) =>
      OrderItemData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OrderItemData.fromMap(Map<String, dynamic> json) => OrderItemData(
        id: json["id"] ?? 0,
        orderId: json["order_id"] ?? 0,
        productId: json["product_id"] ?? 0,
        quantity: json["quantity"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        product: json["product"] != null
            ? ProductData.fromMap(json["product"])
            : null,
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "order_id": orderId,
        "product_id": productId,
        "quantity": quantity,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "product": product?.toMap(),
      };
}

class ProductData {
  final int id;
  final int categoryId;
  final String name;
  final String description;
  final String image;
  final int price;
  final int stock;
  final int isAvailable;
  final String createdAt;
  final String updatedAt;
  final String imageUrl;

  ProductData({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.stock,
    required this.isAvailable,
    required this.createdAt,
    required this.updatedAt,
    required this.imageUrl,
  });

  factory ProductData.fromJson(String str) =>
      ProductData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProductData.fromMap(Map<String, dynamic> json) => ProductData(
        id: json["id"] ?? 0,
        categoryId: json["category_id"] ?? 0,
        name: json["name"] ?? '',
        description: json["description"] ?? '',
        image: json["image"] ?? '',
        price: json["price"] ?? 0,
        stock: json["stock"] ?? 0,
        isAvailable: json["is_available"] ?? 0,
        createdAt: json["created_at"] ?? '',
        updatedAt: json["updated_at"] ?? '',
        imageUrl: json["image_url"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "description": description,
        "image": image,
        "price": price,
        "stock": stock,
        "is_available": isAvailable,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "image_url": imageUrl,
      };
}
