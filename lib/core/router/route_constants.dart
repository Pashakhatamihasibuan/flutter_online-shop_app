// lib/core/router/route_constants.dart
part of 'app_router.dart'; // Atau hapus jika tidak menggunakan part/part of untuk file ini

class RouteConstants {
  static const String splash = 'splash';
  static const String splashPath = '/splash';

  static const String login = 'login';
  static const String loginPath = '/login';

  static const String register = 'register';
  static const String registerPath = 'register';

  static const String root = 'root';
  static const String rootPath = '/'; // Path dasar untuk root

  static const String allCategories = 'allCategories';
  static const String allCategoriesPath = 'all-categories';

  static const String productsByCategory = 'productsByCategory';
  static const String productsByCategoryPath =
      'products-by-category/:id'; // :id sudah ada

  static const String productDetail = 'productDetail';
  static const String productDetailPath = 'product-detail';

  static const String orderList = 'orderList';
  static const String orderListPath = 'order-list';

  static const String cart = 'cart';
  static const String cartPath = 'cart';

  static const String address = 'address';
  static const String addressPath = 'address';

  static const String addAddress = 'addAddress';
  static const String addAddressPath = 'add-address';

  static const String editAddress = 'editAddress';
  static const String editAddressPath = 'edit-address/:id'; // :id sudah ada

  static const String orderDetail = 'orderDetail';
  static const String orderDetailPath = 'order-detail';

  static const String paymentDetail = 'paymentDetail';
  static const String paymentDetailPath = 'payment-detail';

  static const String paymentWaiting = 'paymentWaiting';
  static const String paymentWaitingPath = 'payment-waiting';

  static const String trackingOrder = 'trackingOrder';
  // --- PERBAIKAN DI SINI ---
  // Definisikan path untuk trackingOrder agar menerima orderId.
  // Parameter path diawali dengan ':'
  static const String trackingOrderPath =
      'tracking-order/:${RouteConstants.pathParamOrderId}';
  // Jika trackingOrder adalah rute top-level (bukan sub-rute dari paymentDetail):
  // static const String trackingOrderPath = '/tracking-order/:${RouteConstants.pathParamOrderId}';

  static const String shippingDetail = 'shippingDetail';
  static const String shippingDetailPath = 'shipping-detail';

  // --- TAMBAHKAN KONSTANTA KUNCI PARAMETER ---
  static const String pathParamOrderId = 'orderId';
  static const String pathParamId =
      'id'; // Untuk ID generik (categoryId, addressId)
  static const String pathParamRootTab = 'root_tab';
}
