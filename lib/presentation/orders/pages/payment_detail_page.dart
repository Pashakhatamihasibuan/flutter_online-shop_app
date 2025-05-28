import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/cost/cost_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../models/bank_account_model.dart';
import '../widgets/countdown_timer.dart';
import '../widgets/payment_method.dart';

extension RupiahFormat on int {
  String get toRupiah {
    return 'Rp${toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }
}

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPayment = ValueNotifier<String>('');
    final banks = [
      BankAccountModel(
        code: 'bri',
        name: 'BRI Virtual Account',
        image: Assets.images.banks.bRIDirectDebit.path,
      ),
      BankAccountModel(
        code: 'bca',
        name: 'BCA Virtual Account',
        image: Assets.images.banks.bca.path,
      ),
      BankAccountModel(
        code: 'mandiri',
        name: 'Bank Mandiri',
        image: Assets.images.banks.mandiri.path,
      ),
    ];

    List<BankAccountModel> banksLimit = [banks[0], banks[1]];

    void seeAllTap() {
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
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: AppColors.light,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Metode Pembayaran',
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
                const SpaceHeight(16.0),
                ValueListenableBuilder(
                  valueListenable: selectedPayment,
                  builder: (context, value, _) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PaymentMethod(
                      isActive: value == banks[index].code,
                      data: banks[index],
                      onTap: () {
                        selectedPayment.value = banks[index].code;
                        if (banksLimit.first != banks[index]) {
                          banksLimit[1] = banks[index];
                        }

                        // Simpan payment method ke CheckoutBloc
                        context.read<CheckoutBloc>().add(
                              CheckoutEvent.addPaymentMethod(
                                'bank_transfer',
                                banks[index].code,
                              ),
                            );

                        context.pop();
                      },
                    ),
                    separatorBuilder: (context, index) =>
                        const SpaceHeight(14.0),
                    itemCount: banks.length,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    void buyNowTap() {
      // Dapatkan data checkout untuk API request
      final checkoutBloc = context.read<CheckoutBloc>();
      final apiRequest = checkoutBloc.toApiRequest();

      // TODO: Kirim API request ke backend
      print('API Request: $apiRequest');

      // Navigasi ke halaman menunggu pembayaran
      context.goNamed(
        RouteConstants.paymentWaiting,
        pathParameters: PathParameters().toMap(),
      );

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
              children: [
                const ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: ColoredBox(
                    color: AppColors.light,
                    child: SizedBox(height: 8.0, width: 55.0),
                  ),
                ),
                const SpaceHeight(20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pesananmu dalam Proses',
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
                const SpaceHeight(20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50.0),
                  child: Assets.images.processOrder.image(),
                ),
                const SpaceHeight(50.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          context.goNamed(
                            RouteConstants.trackingOrder,
                            pathParameters: PathParameters().toMap(),
                          );
                        },
                        label: 'Lacak Pesanan',
                      ),
                    ),
                    const SpaceWidth(20.0),
                    Flexible(
                      child: Button.filled(
                        onPressed: () {
                          context.goNamed(
                            RouteConstants.root,
                            pathParameters: PathParameters().toMap(),
                          );
                        },
                        label: 'Back to Home',
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          Row(
            children: [
              const Icon(Icons.schedule),
              const SpaceWidth(12.0),
              const Flexible(
                child: Text(
                  'Selesaikan Pembayaran Dalam',
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SpaceWidth(12.0),
              CountdownTimer(
                minute: 120,
                onTimerCompletion: () {},
              ),
            ],
          ),
          const SpaceHeight(30.0),
          Row(
            children: [
              const Text(
                'Metode Pembayaran',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: seeAllTap,
                child: const Text(
                  'Lihat semua',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SpaceHeight(20.0),
          ValueListenableBuilder(
            valueListenable: selectedPayment,
            builder: (context, value, _) => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => PaymentMethod(
                isActive: value == banksLimit[index].code,
                data: banksLimit[index],
                onTap: () {
                  selectedPayment.value = banksLimit[index].code;

                  // Simpan payment method ke CheckoutBloc
                  context.read<CheckoutBloc>().add(
                        CheckoutEvent.addPaymentMethod(
                          'bank_transfer',
                          banksLimit[index].code,
                        ),
                      );
                },
              ),
              separatorBuilder: (context, index) => const SpaceHeight(14.0),
              itemCount: banksLimit.length,
            ),
          ),
          const SpaceHeight(36.0),
          const Divider(),
          const SpaceHeight(8.0),
          const Text(
            'Ringkasan Pembayaran',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(12.0),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, checkoutState) {
              return BlocBuilder<CostBloc, CostState>(
                builder: (context, costState) {
                  if (checkoutState is CheckoutLoaded &&
                      costState is CostLoaded) {
                    // Hitung total harga produk
                    final totalProductPrice = checkoutState.products.fold<int>(
                      0,
                      (sum, item) =>
                          sum + (item.product.price! * item.quantity),
                    );

                    // Ambil biaya pengiriman dari state atau dari CostBloc
                    final shippingCost = checkoutState.shippingCost > 0
                        ? checkoutState.shippingCost
                        : costState.costResponseModel.rajaongkir?.results?.first
                                .costs?.first.cost?.first.value ??
                            0;

                    // Update shipping cost ke CheckoutBloc jika belum ada
                    if (checkoutState.shippingCost == 0 && shippingCost > 0) {
                      final shippingService = costState
                              .costResponseModel
                              .rajaongkir
                              ?.results
                              ?.first
                              .costs
                              ?.first
                              .service ??
                          '';

                      context.read<CheckoutBloc>().add(
                            CheckoutEvent.addShippingService(
                                shippingService, shippingCost),
                          );
                    }

                    // Hitung total tagihan
                    final totalBill = totalProductPrice + shippingCost;

                    return Column(
                      children: [
                        _priceRow('Total Harga (Produk)', totalProductPrice),
                        const SpaceHeight(5.0),
                        _priceRow('Total Ongkos Kirim', shippingCost),
                        const Divider(),
                        const SpaceHeight(8.0),
                        _priceRow('Total Belanja', totalBill.toInt()),
                      ],
                    );
                  }
                  return Column(
                    children: [
                      _priceRow('Total Harga (Produk)', 0),
                      SpaceHeight(5.0),
                      _priceRow('Total Ongkos Kirim', 0),
                      Divider(),
                      SpaceHeight(8.0),
                      _priceRow('Total Belanja', 0),
                    ],
                  );
                },
              );
            },
          ),
          const SpaceHeight(20.0),
          ValueListenableBuilder(
            valueListenable: selectedPayment,
            builder: (context, value, _) => Button.filled(
              disabled: value.isEmpty,
              onPressed: value.isNotEmpty ? buyNowTap : () {},
              label: 'Bayar Sekarang',
            ),
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
