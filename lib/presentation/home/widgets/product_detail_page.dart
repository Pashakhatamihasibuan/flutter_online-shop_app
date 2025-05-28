import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:badges/badges.dart';
import 'package:flutter_onlineshop_app/core/assets/assets.gen.dart';
import 'package:flutter_onlineshop_app/core/components/spaces.dart';
import 'package:flutter_onlineshop_app/core/core.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/checkout/checkout_bloc.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  Widget _buildBadgeCart(int quantity, BuildContext context) {
    final icon = IconButton(
      onPressed: () {
        Navigator.pushNamed(context, RouteConstants.cart);
      },
      icon: Assets.icons.cart.svg(height: 24.0),
    );
    return quantity > 0
        ? Badge(
            position: BadgePosition.topEnd(top: 0, end: 0),
            badgeContent:
                Text('$quantity', style: const TextStyle(color: Colors.white)),
            child: icon,
          )
        : icon;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        centerTitle: true,
        elevation: 0,
        actions: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoaded) {
                final totalQty = state.products
                    .fold<int>(0, (sum, item) => sum + item.quantity);
                return _buildBadgeCart(totalQty, context);
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceWidth(8.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Product Image
            Container(
              color: Colors.grey[100],
              height: 300,
              width: double.infinity,
              child: product.imageUrl != null
                  ? Image.network(
                      product.imageUrl!,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    )
                  : const Icon(Icons.image, size: 100),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name and Price
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name ?? 'N/A',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'IDR ${product.price?.toStringAsFixed(0) ?? '0'}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                      // Stock Availability
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: (product.stock ?? 0) > 0
                              ? AppColors.primary
                              : Colors.red,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          'Tersedia : ${product.stock ?? 0}',
                          style: TextStyle(
                            backgroundColor: AppColors.primary,
                            fontSize: 16,
                            color: (product.stock ?? 0) > 0
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32, thickness: 1),
                  // Store Information
                  const Row(
                    children: [
                      Icon(Icons.store, size: 24),
                      SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Asean Stationery Official Store',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Official Store',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Product Description
                  const Text(
                    'Deskripsi Produk',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    product.description ?? 'Tidak ada deskripsi produk',
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 32),

                  // Action Buttons
                  BlocBuilder<CheckoutBloc, CheckoutState>(
                    builder: (context, state) {
                      final isInCart = state is CheckoutLoaded &&
                          state.products
                              .any((item) => item.product.id == product.id);
                      return Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () {
                                if (isInCart) {
                                  context.read<CheckoutBloc>().add(
                                        RemoveItem(product),
                                      );
                                } else {
                                  context.read<CheckoutBloc>().add(
                                        AddItem(product),
                                      );
                                }
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isInCart
                                          ? 'Produk dihapus dari keranjang'
                                          : 'Produk ditambahkan ke keranjang',
                                    ),
                                  ),
                                );
                              },
                              style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                side: BorderSide(
                                  color:
                                      isInCart ? Colors.red : AppColors.primary,
                                ),
                              ),
                              child: Text(
                                isInCart
                                    ? 'Hapus dari Keranjang'
                                    : 'Masukkan Keranjang',
                                style: TextStyle(
                                  color:
                                      isInCart ? Colors.red : AppColors.primary,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (!isInCart) {
                                  context.read<CheckoutBloc>().add(
                                        AddItem(product),
                                      );
                                }
                                Navigator.pushNamed(
                                    context, RouteConstants.cart);
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                backgroundColor: AppColors.primary,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                              ),
                              child: const Text(
                                'Beli Sekarang',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
