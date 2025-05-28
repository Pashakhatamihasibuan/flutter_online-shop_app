import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/product/product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/pages/dashboard_page.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/all_categories_page.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/product_detail_page.dart';
import 'package:flutter_onlineshop_app/presentation/orders/pages/history_order_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../data/datasources/product_remote_datasource.dart';
import '../../presentation/address/models/address_model.dart';
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
        path: RouteConstants.rootPath,
        builder: (context, state) {
          final tab = int.tryParse(state.pathParameters['root_tab'] ?? '') ?? 0;
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
              final categories = state.extra as List<Category>;
              return AllCategoriesPage(categories: categories);
            },
          ),
          GoRoute(
            name: RouteConstants.productsByCategory,
            path: 'products-by-category/:id',
            builder: (context, state) {
              final category = state.extra as Category;
              return BlocProvider(
                create: (_) => ProductBloc(ProductRemoteDatasource())
                  ..add(GetProductByCategory(category.id!)),
                child: ProductsByCategoryPage(category: category),
              );
            },
          ),
          GoRoute(
            name: RouteConstants
                .productDetail, // Make sure this matches your constant
            path: 'product-detail', // Note: using hyphen instead of underscore
            builder: (context, state) {
              final product = state.extra as Product;
              return ProductDetailPage(product: product);
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
                path: 'edit-address/:id',
                builder: (context, state) {
                  final id = int.parse(state.pathParameters['id']!);
                  return EditAddressPage(addressId: id);
                },
              ),
            ],
          ),
          GoRoute(
            name: RouteConstants.orderDetail,
            path: RouteConstants.orderDetailPath,
            builder: (context, state) => const OrderDetailPage(),
            routes: [
              GoRoute(
                name: RouteConstants.paymentDetail,
                path: RouteConstants.paymentDetailPath,
                builder: (context, state) => const PaymentDetailPage(),
                routes: [
                  GoRoute(
                    name: RouteConstants.paymentWaiting,
                    path: RouteConstants.paymentWaitingPath,
                    builder: (context, state) => const PaymentWaitingPage(),
                  ),
                  GoRoute(
                    name: RouteConstants.trackingOrder,
                    path: RouteConstants.trackingOrderPath,
                    builder: (context, state) => const TrackingOrderPage(),
                    routes: [
                      GoRoute(
                        name: RouteConstants.shippingDetail,
                        path: RouteConstants.shippingDetailPath,
                        builder: (context, state) => const ShippingDetailPage(),
                      ),
                    ],
                  ),
                ],
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
          body: Center(
            child: Text(
              state.error.toString(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    },
  );
}
