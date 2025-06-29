import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/cost/cost_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/widgets/cart_tile.dart';
import 'package:go_router/go_router.dart';
import 'package:badges/badges.dart' as badges;

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';

extension RupiahFormat on int {
  String get toRupiah {
    if (this == 0) return 'Rp 0';
    return 'Rp${toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }
}

class OrderDetailPage extends StatefulWidget {
  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  ShippingModel? selectedShipping;

  @override
  void initState() {
    super.initState();
    final checkoutState = context.read<CheckoutBloc>().state;
    if (checkoutState is CheckoutLoaded) {
      final destinationCityId = checkoutState.addressId.toString();

      // PERBAIKAN: Selalu gunakan berat statis 150 gram per item
      final totalWeight = checkoutState.products.fold<int>(
        0,
        (previousValue, element) => previousValue + (150 * element.quantity),
      );

      // Pastikan ada tujuan dan berat sebelum memanggil API
      if (destinationCityId != '0' && totalWeight > 0) {
        context.read<CostBloc>().add(
              CostEvent.getCost(
                '501', // ID kota asal (contoh: Yogyakarta)
                destinationCityId,
                totalWeight.toString(),
                'tiki', // Kurir default
              ),
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pesanan'),
        actions: [
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoaded) {
                final totalQty = state.products
                    .fold<int>(0, (sum, item) => sum + item.quantity);
                return _buildBadgeCart(context, totalQty);
              }
              return const SizedBox.shrink();
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
              if (state is CheckoutLoaded) {
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.products.length,
                  itemBuilder: (context, index) =>
                      CartTile(data: state.products[index]),
                  separatorBuilder: (context, index) => const SpaceHeight(16.0),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceHeight(36.0),
          _SelectShipping(
            onSelected: (shipping) {
              setState(() {
                selectedShipping = shipping;
              });
              // Simpan ongkos kirim dan layanan ke CheckoutBloc
              context.read<CheckoutBloc>().add(
                    CheckoutEvent.addShippingService(
                      shipping.type,
                      shipping.priceStart,
                    ),
                  );
            },
            selectedShipping: selectedShipping,
          ),
          const SpaceHeight(36.0),
          const Divider(),
          const SpaceHeight(8.0),
          const Text(
            'Detail Belanja :',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(12.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoaded) {
                final totalProductPrice = state.products.fold<int>(
                  0,
                  (total, item) =>
                      total + ((item.product.price ?? 0) * item.quantity),
                );
                // Ambil biaya pengiriman dari state lokal yang sudah diupdate
                final shippingCost = selectedShipping?.priceStart ?? 0;
                final totalPrice = totalProductPrice + shippingCost;

                return Column(
                  children: [
                    _priceRow('Total Harga (Produk)', totalProductPrice),
                    const SpaceHeight(5.0),
                    _priceRow('Total Ongkos Kirim', shippingCost),
                    const Divider(),
                    const SpaceHeight(8.0),
                    _priceRow('Total Belanja', totalPrice),
                  ],
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceHeight(20.0),
          Button.filled(
            disabled: selectedShipping ==
                null, // Nonaktifkan jika pengiriman belum dipilih
            onPressed: () {
              context.goNamed(
                RouteConstants.paymentDetail,
                pathParameters: GoRouterState.of(context).pathParameters,
              );
            },
            label: 'Pilih Pembayaran',
          ),
        ],
      ),
    );
  }

  Widget _priceRow(String title, int amount) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        Text(
          amount.toRupiah,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _SelectShipping extends StatelessWidget {
  final Function(ShippingModel) onSelected;
  final ShippingModel? selectedShipping;

  const _SelectShipping({
    required this.onSelected,
    this.selectedShipping,
  });

  @override
  Widget build(BuildContext context) {
    void onSelectShippingTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext modalContext) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(40.0)),
                    child: ColoredBox(
                      color: AppColors.light,
                      child: SizedBox(height: 8.0, width: 55.0),
                    ),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Metode Pengiriman',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.light,
                      child: IconButton(
                        onPressed: () => context.pop(),
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(18.0),
                const Divider(color: AppColors.stroke),
                BlocBuilder<CostBloc, CostState>(
                  builder: (context, state) {
                    if (state is CostLoaded) {
                      final costs = state.costResponseModel.rajaongkir?.results
                              ?.firstOrNull?.costs ??
                          [];
                      return Container(
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.6,
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final item = costs[index];
                            final costValue = item.cost?.firstOrNull?.value;
                            final etd = item.cost?.firstOrNull?.etd ?? '-';
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () {
                                if (costValue != null) {
                                  onSelected(ShippingModel(
                                    type:
                                        '${item.service ?? ''} (${item.description ?? ''})',
                                    priceStart: costValue,
                                    priceEnd: costValue,
                                    estimate: DateTime.now().add(
                                      Duration(
                                          days: int.tryParse(
                                                  etd.split(' ').first) ??
                                              3),
                                    ),
                                  ));
                                  context.pop();
                                }
                              },
                              title: Text(
                                '${item.description ?? item.service ?? 'Layanan'} '
                                '(${(costValue ?? 0).toRupiah})',
                                style: const TextStyle(fontSize: 14),
                              ),
                              subtitle: Text(
                                'Estimasi tiba $etd Hari',
                                style: const TextStyle(fontSize: 12),
                              ),
                              trailing: const Icon(
                                Icons.chevron_right,
                                color: AppColors.primary,
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const Divider(color: AppColors.stroke),
                          itemCount: costs.length,
                        ),
                      );
                    }
                    if (state is CostLoading) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    if (state is CostError) {
                      return Center(child: Text(state.message));
                    }
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Memuat data pengiriman...'),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      );
    }

    return GestureDetector(
      onTap: onSelectShippingTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.stroke),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                selectedShipping != null
                    ? '${selectedShipping!.type} - ${selectedShipping!.priceStart.toRupiah}'
                    : 'Pilih Pengiriman',
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}

Widget _buildBadgeCart(BuildContext context, int quantity) {
  final icon = IconButton(
    onPressed: () {
      context.goNamed(RouteConstants.cart,
          pathParameters: GoRouterState.of(context).pathParameters);
    },
    icon: Assets.icons.cart.svg(height: 24.0),
  );
  return quantity > 0
      ? badges.Badge(
          position: badges.BadgePosition.topEnd(top: 0, end: 0),
          badgeContent:
              Text('$quantity', style: const TextStyle(color: Colors.white)),
          child: icon,
        )
      : icon;
}

class ShippingModel {
  final String type;
  final int priceStart;
  final int priceEnd;
  final DateTime estimate;

  ShippingModel({
    required this.type,
    required this.priceStart,
    required this.priceEnd,
    required this.estimate,
  });
}
