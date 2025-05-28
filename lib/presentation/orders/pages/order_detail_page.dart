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
  @override
  void initState() {
    super.initState();
    // Debug: Print request parameters
    print('=== API REQUEST PARAMETERS ===');
    print('Origin: 501');
    print('Destination: 114');
    print('Weight: 1700');
    print('Courier: jne');
    print('==============================');

    context.read<CostBloc>().add(
          const CostEvent.getCost(
            '501', // origin
            '114', // destination
            '1700', // weight
            'tiki', // courier - CHANGED FROM 'jne' TO 'tiki'
          ),
        );
  }

  ShippingModel? selectedShipping;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Orders'),
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
                final carts = state.products;
                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: carts.length,
                  itemBuilder: (context, index) => CartTile(data: carts[index]),
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
                final carts = state.products;
                final totalProductPrice = carts.fold<int>(
                  0,
                  (total, item) =>
                      total + (item.product.price! * item.quantity),
                );
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
            onPressed: () {
              context.goNamed(
                RouteConstants.paymentDetail,
                pathParameters: PathParameters().toMap(),
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

class _SelectShipping extends StatefulWidget {
  final Function(ShippingModel) onSelected;
  final ShippingModel? selectedShipping;

  const _SelectShipping({
    required this.onSelected,
    required this.selectedShipping,
  });

  @override
  State<_SelectShipping> createState() => _SelectShippingState();
}

class _SelectShippingState extends State<_SelectShipping> {
  @override
  Widget build(BuildContext context) {
    void onSelectShippingTap() {
      showModalBottomSheet(
        context: context,
        useSafeArea: true,
        isScrollControlled: true,
        backgroundColor: AppColors.white,
        builder: (BuildContext context) {
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
                    // Debug: Print state type
                    print('Current CostBloc state: ${state.runtimeType}');

                    if (state is CostLoaded) {
                      final costResponse = state.costResponseModel;
                      final results = costResponse.rajaongkir?.results;

                      // Debug: Print complete response structure
                      print('=== API RESPONSE DEBUG ===');
                      print('Results count: ${results?.length ?? 0}');

                      if (results != null && results.isNotEmpty) {
                        print(
                            'Courier: ${results[0].code} - ${results[0].name}');
                        final costs = results[0].costs;
                        print('Costs count: ${costs?.length ?? 0}');

                        // Print all costs with details
                        if (costs != null) {
                          for (int i = 0; i < costs.length; i++) {
                            final cost = costs[i];
                            final costValue = cost.cost?.firstOrNull?.value;
                            final etd = cost.cost?.firstOrNull?.etd;
                            print(
                                'Cost $i: ${cost.service} - ${cost.description} - Rp$costValue - ${etd} days');
                          }
                        }
                      }
                      print('========================');

                      if (results == null || results.isEmpty) {
                        return const Center(
                            child: Text('Tidak ada data pengiriman'));
                      }

                      final costs = results[0].costs;

                      // Debug: Print costs
                      print('Costs count: ${costs?.length ?? 0}');

                      if (costs == null || costs.isEmpty) {
                        return const Center(
                            child: Text('Tidak ada biaya pengiriman'));
                      }

                      // Debug: Print each cost item
                      for (int i = 0; i < costs.length; i++) {
                        final cost = costs[i];
                        print(
                            'Cost $i: ${cost.service} - ${cost.description} - ${cost.cost?.firstOrNull?.value}');
                      }

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

                            // Debug: Print item being built
                            print(
                                'Building item $index: ${item.service} - ${item.description}');

                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              onTap: () {
                                print(
                                    'Tapped on: ${item.service} - ${item.description}');

                                if ((item.description != null ||
                                        item.service != null) &&
                                    costValue != null) {
                                  widget.onSelected(ShippingModel(
                                    type: item.service ?? item.description!,
                                    priceStart: costValue,
                                    priceEnd: costValue,
                                    estimate: DateTime.now().add(
                                      Duration(days: int.tryParse(etd) ?? 3),
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
                              trailing: Icon(
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
                    } else if (state is CostLoading) {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else if (state is CostError) {
                      final errorState = state as CostError;
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                size: 48,
                                color: Colors.red,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Error: ${errorState.message}',
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.red),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  // Retry the API call with same parameters
                                  print('=== RETRYING API CALL ===');
                                  context.read<CostBloc>().add(
                                        const CostEvent.getCost(
                                          '501',
                                          '114',
                                          '1700',
                                          'tiki', // Make sure using 'tiki' not 'jne'
                                        ),
                                      );
                                },
                                child: const Text('Coba Lagi'),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text('Memuat data pengiriman...'),
                        ),
                      );
                    }
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
                widget.selectedShipping != null
                    ? '${widget.selectedShipping!.type} - ${widget.selectedShipping!.priceStart.toRupiah}'
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
          pathParameters: PathParameters().toMap());
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

  String get priceFormat => priceStart.toRupiah;
  String get priceRangeFormat =>
      '${priceStart.toRupiah} - ${priceEnd.toRupiah}';

  String get estimateFormat {
    final day = estimate.day.toString().padLeft(2, '0');
    final month = estimate.month.toString().padLeft(2, '0');
    final year = estimate.year;
    return '$day/$month/$year';
  }
}
