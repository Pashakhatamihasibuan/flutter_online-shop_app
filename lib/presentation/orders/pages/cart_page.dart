import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../home/models/product_model.dart';
import '../../home/models/store_model.dart';
import '../models/cart_model.dart';
import '../widgets/cart_tile.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> carts = [
      ProductModel(
        images: [
          Assets.images.products.earphone.path,
          Assets.images.products.earphone.path,
          Assets.images.products.earphone.path,
        ],
        name: 'Earphone',
        price: 320000,
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
          IconButton(
            onPressed: () {
              context.goNamed(
                RouteConstants.cart,
                pathParameters: PathParameters(
                  rootTab: RootTab.order,
                ).toMap(),
              );
            },
            icon: Assets.icons.cart.svg(height: 24.0),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: carts.length,
            itemBuilder: (context, index) => CartTile(
              data: CartModel(
                product: carts[index],
                quantity: 1,
              ),
            ),
            separatorBuilder: (context, index) => const SpaceHeight(16.0),
          ),
          const SpaceHeight(50.0),
          Row(
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
                350000.currencyFormatRp,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SpaceHeight(40.0),
          Button.filled(
            onPressed: () {
              context.goNamed(
                RouteConstants.address,
                pathParameters: PathParameters(
                  rootTab: RootTab.order,
                ).toMap(),
              );
            },
            label: 'Checkout (${carts.length})',
          ),
        ],
      ),
    );
  }
}
