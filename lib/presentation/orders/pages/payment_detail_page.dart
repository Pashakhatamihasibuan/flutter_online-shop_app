import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/core/components/core.dart';
import 'package:flutter_onlineshop_app/presentation/home/models/product_quantity.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../bloc/order/order_bloc.dart';
import '../models/bank_account_model.dart';
import '../widgets/payment_method.dart';

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPaymentNotifier = ValueNotifier<BankAccountModel?>(null);

    final banks = [
      BankAccountModel(
          code: 'bri',
          name: 'BRI Virtual Account',
          image: Assets.images.banks.bri.path),
      BankAccountModel(
          code: 'bca',
          name: 'BCA Virtual Account',
          image: Assets.images.banks.bca.path),
      BankAccountModel(
          code: 'mandiri',
          name: 'Bank Mandiri VA',
          image: Assets.images.banks.mandiri.path),
      BankAccountModel(
          code: 'bni',
          name: 'BNI Virtual Account',
          image: Assets.images.banks.bni.path),
    ];

    void seeAllTap() {
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
                      'Pilih Metode Pembayaran',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: AppColors.light,
                      child: IconButton(
                        onPressed: () => Navigator.of(modalContext).pop(),
                        icon: const Icon(Icons.close, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(16.0),
                ValueListenableBuilder<BankAccountModel?>(
                  valueListenable: selectedPaymentNotifier,
                  builder: (context, currentSelectedBank, _) =>
                      ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => PaymentMethod(
                      isActive: currentSelectedBank?.code == banks[index].code,
                      data: banks[index],
                      onTap: () {
                        selectedPaymentNotifier.value = banks[index];
                        context.read<CheckoutBloc>().add(
                              CheckoutEvent.addPaymentMethod(
                                'bank_transfer',
                                banks[index].code,
                              ),
                            );
                        Navigator.of(modalContext).pop();
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pembayaran'),
      ),
      body: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) {
          if (state is DoOrderLoaded) {
            context.goNamed(
              RouteConstants.paymentWaiting,
              pathParameters: GoRouterState.of(context).pathParameters,
            );
          }
          if (state is DoOrderError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            Row(
              children: [
                const Text(
                  'Metode Pembayaran',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                InkWell(
                  onTap: seeAllTap,
                  child: const Text(
                    'Lihat semua',
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SpaceHeight(12.0),
            ValueListenableBuilder<BankAccountModel?>(
              valueListenable: selectedPaymentNotifier,
              builder: (context, selectedBank, _) {
                if (selectedBank != null) {
                  return PaymentMethod(
                    isActive: true,
                    data: selectedBank,
                    onTap: seeAllTap,
                  );
                }
                return InkWell(
                  onTap: seeAllTap,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Pilih Metode Pembayaran',
                            style: TextStyle(fontSize: 16)),
                        Icon(Icons.chevron_right, color: AppColors.grey)
                      ],
                    ),
                  ),
                );
              },
            ),
            const SpaceHeight(24.0),
            const Divider(),
            const SpaceHeight(8.0),
            const Text(
              'Ringkasan Pembayaran',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SpaceHeight(12.0),
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, checkoutState) {
                if (checkoutState is CheckoutLoaded) {
                  final totalProductPrice = checkoutState.products.fold<int>(
                    0,
                    (sum, item) =>
                        sum + ((item.product.price ?? 0) * item.quantity),
                  );
                  final totalBill =
                      totalProductPrice + checkoutState.shippingCost;

                  return Column(
                    children: [
                      _priceRow('Total Harga (Produk)', totalProductPrice),
                      const SpaceHeight(5.0),
                      _priceRow(
                          'Total Ongkos Kirim', checkoutState.shippingCost),
                      const Divider(),
                      const SpaceHeight(8.0),
                      _priceRow('Total Tagihan', totalBill),
                    ],
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            const SpaceHeight(30.0),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, orderState) {
                return ValueListenableBuilder<BankAccountModel?>(
                  valueListenable: selectedPaymentNotifier,
                  builder: (context, selectedBank, _) {
                    final bool isLoading = orderState is DoOrderLoading;
                    final bool isDisabled = selectedBank == null || isLoading;

                    return Button.filled(
                      disabled: isDisabled,
                      onPressed: () {
                        if (isDisabled) return;

                        final checkoutState =
                            context.read<CheckoutBloc>().state;

                        if (checkoutState is CheckoutLoaded) {
                          if (checkoutState.addressId == 0) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Alamat pengiriman belum dipilih.')),
                            );
                            return;
                          }
                          if (checkoutState.shippingService.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Metode pengiriman belum dipilih.')),
                            );
                            return;
                          }
                          if (checkoutState.paymentMethod.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Metode pembayaran belum dipilih.')),
                            );
                            return;
                          }

                          final productsForOrder =
                              checkoutState.products.map((item) {
                            return ProductQuantity(
                                product: item.product, quantity: item.quantity);
                          }).toList();

                          // PERBAIKAN: Hapus 'subtotal' dan 'totalCost' dari pemanggilan event
                          context.read<OrderBloc>().add(
                                DoOrder(
                                  addressId: checkoutState.addressId,
                                  paymentMethod: checkoutState.paymentMethod,
                                  shippingService:
                                      checkoutState.shippingService,
                                  shippingCost: checkoutState.shippingCost,
                                  paymentVaName: checkoutState.paymentVaName,
                                  products: productsForOrder,
                                ),
                              );
                        }
                      },
                      label: isLoading ? 'MEMPROSES...' : 'Bayar Sekarang',
                    );
                  },
                );
              },
            ),
          ],
        ),
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
