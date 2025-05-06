import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../home/models/product_model.dart';
import '../../home/models/store_model.dart';
import '../models/cart_model.dart';
import '../widgets/cart_tile.dart';

import 'package:badges/badges.dart' as badges;

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> carts = [
      ProductModel(
        images: [
          Assets.images.products.correctionpen.path,
          Assets.images.products.correctionpen.path,
          Assets.images.products.correctionpen.path,
        ],
        name: 'Correction Pen',
        price: 4950,
        stock: 20,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        store: StoreModel(
          name: 'CWB Online Store',
          type: StoreEnum.officialStore,
          imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
        ),
      ),
      ProductModel(
        images: [
          Assets.images.products.sepatu.path,
          Assets.images.products.sepatu2.path,
          Assets.images.products.sepatu.path,
        ],
        name: 'Sepatu Nike',
        price: 2200000,
        stock: 20,
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ',
        store: StoreModel(
          name: 'CWB Online Store',
          type: StoreEnum.officialStore,
          imageUrl: 'https://avatars.githubusercontent.com/u/534678?v=4',
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case CheckoutLoaded:
                  final checkoutState = state as CheckoutLoaded;
                  final totalQuantity = checkoutState.products.fold<int>(
                    0,
                    (previousValue, element) =>
                        previousValue + element.quantity,
                  );
                  return totalQuantity > 0
                      ? badges.Badge(
                          position: badges.BadgePosition.topEnd(top: 0, end: 0),
                          badgeContent: Text(
                            totalQuantity.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                          child: IconButton(
                            onPressed: () {
                              context.goNamed(
                                RouteConstants.cart,
                                pathParameters: PathParameters().toMap(),
                              );
                            },
                            icon: Assets.icons.cart.svg(height: 24.0),
                          ),
                        )
                      : IconButton(
                          onPressed: () {
                            context.goNamed(
                              RouteConstants.cart,
                              pathParameters: PathParameters().toMap(),
                            );
                          },
                          icon: Assets.icons.cart.svg(height: 24.0),
                        );
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          const SpaceWidth(8.0),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              switch (state.runtimeType) {
                case CheckoutLoaded:
                  final checkoutState = state as CheckoutLoaded;
                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: checkoutState.products.length,
                    itemBuilder: (context, index) =>
                        CartTile(data: checkoutState.products[index]),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(16.0),
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
          const SpaceHeight(50.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoaded) {
                final total = state.products.fold<int>(
                  0,
                  (previousValue, item) =>
                      previousValue + (item.product.price! * item.quantity),
                );

                return Row(
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      total.currencyFormatRp,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          const SpaceHeight(40.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoaded) {
                final totalQuantity = state.products.fold<int>(
                  0,
                  (previousValue, item) => previousValue + item.quantity,
                );

                return Button.filled(
                  onPressed: () async {
                    final isAuth = await AuthLocalDatasource().isAuth();
                    if (!isAuth) {
                      context.pushNamed(RouteConstants.login);
                    } else {
                      context.goNamed(
                        RouteConstants.address,
                        pathParameters: PathParameters(
                          rootTab: RootTab.order,
                        ).toMap(),
                      );
                    }
                  },
                  label: 'Checkout ($totalQuantity)',
                );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
