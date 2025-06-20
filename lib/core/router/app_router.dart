import 'package:flutter_bloc/flutter_bloc.dart';
// Sembunyikan 'Product' dari order_response_model.dart agar tidak konflik
import 'package:flutter_onlineshop_app/data/models/responses/order_response_model.dart'
    hide Product;
// Biarkan impor ini apa adanya, karena 'Product' dari sini yang akan kita gunakan untuk ProductDetailPage
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/product/product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/pages/dashboard_page.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/all_categories_page.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/product_detail_page.dart';
import 'package:flutter_onlineshop_app/presentation/orders/pages/history_order_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/datasources/product_remote_datasource.dart';

import '../../presentation/address/pages/add_address_page.dart';
import '../../presentation/address/pages/address_page.dart';
import '../../presentation/address/pages/edit_address_page.dart';
import '../../presentation/auth/pages/login_page.dart';
import '../../presentation/auth/pages/register_page.dart';
import '../../presentation/home/widgets/products_by_categories_page.dart';
import '../../presentation/intro/splash_page.dart';
import '../../presentation/orders/pages/cart_page.dart';
import '../../presentation/orders/pages/order_detail_page.dart';
import '../../presentation/orders/pages/payment_detail_page.dart';
import '../../presentation/orders/pages/payment_waiting_page.dart';
import '../../presentation/orders/pages/shipping_detail_page.dart';
import '../../presentation/orders/pages/tracking_order_page.dart';
import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';

part 'route_constants.dart';
part 'enums/root_tab.dart';
part 'models/path_parameters.dart';

class AppRouter {
  final router = GoRouter(
    initialLocation: RouteConstants.splashPath,
    routes: [
      GoRoute(
        name: RouteConstants.splash,
        path: RouteConstants.splashPath,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        name: RouteConstants.login,
        path: RouteConstants.loginPath,
        builder: (context, state) => const LoginPage(),
        routes: [
          GoRoute(
            name: RouteConstants.register,
            path: RouteConstants.registerPath,
            builder: (context, state) => const RegisterPage(),
          ),
        ],
      ),
      GoRoute(
        name: RouteConstants.root,
        path: '/:${RouteConstants.pathParamRootTab}',
        builder: (context, state) {
          final tab = int.tryParse(
                  state.pathParameters[RouteConstants.pathParamRootTab] ??
                      '') ??
              0;
          return DashboardPage(
            key: state.pageKey,
            currentTab: tab,
          );
        },
        routes: [
          GoRoute(
            name: RouteConstants.allCategories,
            path: RouteConstants.allCategoriesPath,
            builder: (context, state) {
              if (state.extra is List<Category>) {
                final categories = state.extra as List<Category>;
                return AllCategoriesPage(categories: categories);
              }
              return _ErrorPage(error: "Data kategori tidak valid.");
            },
          ),
          GoRoute(
            name: RouteConstants.productsByCategory,
            path: 'products-by-category/:${RouteConstants.pathParamId}',
            builder: (context, state) {
              final categoryIdString =
                  state.pathParameters[RouteConstants.pathParamId];
              final category = state.extra as Category?;

              if (categoryIdString != null &&
                  int.tryParse(categoryIdString) != null) {
                final categoryId = int.parse(categoryIdString);
                if (category != null && category.id == categoryId) {
                  return BlocProvider(
                    create: (_) => ProductBloc(ProductRemoteDatasource())
                      ..add(GetProductByCategory(categoryId)),
                    child: ProductsByCategoryPage(category: category),
                  );
                }
                return _ErrorPage(
                    error:
                        "Data kategori dari 'extra' tidak cocok atau tidak ada untuk ID path: $categoryIdString.");
              }
              return _ErrorPage(error: "ID kategori tidak valid.");
            },
          ),
          GoRoute(
            name: RouteConstants.productDetail,
            path: 'product-detail',
            builder: (context, state) {
              if (state.extra is Product) {
                final product = state.extra as Product;
                return ProductDetailPage(product: product);
              }
              return _ErrorPage(
                  error: 'Data produk tidak valid atau tidak ditemukan.');
            },
          ),
          GoRoute(
            name: RouteConstants.orderList,
            path: RouteConstants.orderListPath,
            builder: (context, state) => const HistoryOrderPage(),
          ),
          GoRoute(
            name: RouteConstants.cart,
            path: RouteConstants.cartPath,
            builder: (context, state) => const CartPage(),
          ),
          GoRoute(
            name: RouteConstants.address,
            path: RouteConstants.addressPath,
            builder: (context, state) => const AddressPage(),
            routes: [
              GoRoute(
                name: RouteConstants.addAddress,
                path: RouteConstants.addAddressPath,
                builder: (context, state) => const AddAddressPage(),
              ),
              GoRoute(
                name: RouteConstants.editAddress,
                path: 'edit-address/:${RouteConstants.pathParamId}',
                builder: (context, state) {
                  final idString =
                      state.pathParameters[RouteConstants.pathParamId];
                  if (idString != null && int.tryParse(idString) != null) {
                    final id = int.parse(idString);
                    return EditAddressPage(addressId: id);
                  }
                  return _ErrorPage(error: "ID alamat tidak valid.");
                },
              ),
            ],
          ),
          GoRoute(
            name: RouteConstants.orderDetail,
            path: RouteConstants.orderDetailPath,
            builder: (context, state) {
              return const OrderDetailPage();
            },
            routes: [
              GoRoute(
                name: RouteConstants.paymentDetail,
                path: RouteConstants.paymentDetailPath,
                builder: (context, state) {
                  return const PaymentDetailPage();
                },
                routes: [
                  GoRoute(
                    name: RouteConstants.paymentWaiting,
                    path: RouteConstants.paymentWaitingPath,
                    builder: (context, state) {
                      // --- PERBAIKAN DI SINI ---
                      // PaymentWaitingPage tidak lagi memerlukan orderResponse di konstruktor
                      // karena ia menggunakan BlocBuilder untuk mendapatkan datanya.
                      // Pastikan OrderBloc sudah di-provide di atas widget ini.
                      // Jika Anda perlu meneruskan sesuatu (misalnya, flag atau ID awal jika diperlukan
                      // sebelum Bloc siap), Anda bisa melakukannya via 'extra', tapi untuk kasus ini,
                      // jika data diambil murni dari Bloc, tidak perlu 'extra'.
                      return const PaymentWaitingPage();
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            name: RouteConstants.trackingOrder,
            path: 'tracking-order/:${RouteConstants.pathParamOrderId}',
            builder: (context, state) {
              final orderId =
                  state.pathParameters[RouteConstants.pathParamOrderId];
              if (orderId != null && orderId.isNotEmpty) {
                return TrackingOrderPage(orderId: orderId);
              }
              return _ErrorPage(error: 'Order ID tidak valid untuk pelacakan.');
            },
            routes: [
              GoRoute(
                name: RouteConstants.shippingDetail,
                path: RouteConstants.shippingDetailPath,
                builder: (context, state) {
                  return const ShippingDetailPage();
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
        key: state.pageKey,
        child: Scaffold(
          appBar: AppBar(title: const Text("Halaman Tidak Ditemukan")),
          body: Center(
            child: Text(
              state.error?.toString() ?? "Terjadi kesalahan pada rute.",
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}

class _ErrorPage extends StatelessWidget {
  final String error;
  const _ErrorPage({required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Navigasi')),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(error, textAlign: TextAlign.center),
      )),
    );
  }
}
