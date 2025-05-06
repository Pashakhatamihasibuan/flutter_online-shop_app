part of 'app_router.dart';

class RouteConstants {
  /// Splash Page
  static const String splash = 'splash';
  static const String splashPath = '/splash';

  /// Login Page
  static const String login = 'login';
  static const String loginPath = '/login';

  /// Register Page
  static const String register = 'register';
  static const String registerPath = 'register';

  /// Dashboard / Root Page
  static const String root = 'root';
  static const String rootPath = '/:root_tab';

  /// All Categories Page
  static const String allCategories = 'all_categories';
  static const String allCategoriesPath = 'categories';

  /// Products by Category Page
  static const String productsByCategory = 'products_by_category';
  static const String productsByCategoryPath = 'products-by-category/:id';

  /// Product Detail Page
  static const String productDetail = 'product_detail';
  static const String productDetailPath = 'product_detail';

  /// Cart Page
  static const String cart = 'cart';
  static const String cartPath = 'cart';

  /// Address Page
  static const String address = 'address';
  static const String addressPath = 'address';

  /// Add Address Page
  static const String addAddress = 'add_address';
  static const String addAddressPath = 'address/add';

  /// Edit Address Page
  static const String editAddress = 'edit_address';
  static const String editAddressPath = 'address/edit';

  /// Order Detail Page
  static const String orderDetail = 'order_detail';
  static const String orderDetailPath = 'order_detail';

  /// Payment Detail Page
  static const String paymentDetail = 'payment_detail';
  static const String paymentDetailPath = 'payment_detail';

  /// Tracking Order Page
  static const String trackingOrder = 'tracking_order';
  static const String trackingOrderPath = 'tracking_order';

  /// Shipping Detail Page
  static const String shippingDetail = 'shipping_detail';
  static const String shippingDetailPath = 'shipping_detail';

  /// Payment Waiting Page
  static const String paymentWaiting = 'payment_waiting';
  static const String paymentWaitingPath = 'payment_waiting';

  /// Order List Page
  static const String orderList = 'order_list';
  static const String orderListPath = 'order_list';
}
