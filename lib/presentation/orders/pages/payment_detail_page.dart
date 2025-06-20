import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/models/product_quantity.dart';
import 'package:flutter_onlineshop_app/presentation/orders/bloc/order/order_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/orders/pages/order_detail_page.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../bloc/cost/cost_bloc.dart';
import '../models/bank_account_model.dart';
import '../widgets/payment_method.dart';

// Asumsi ekstensi toRupiah sudah ada di core.dart atau int_ext.dart dan diimpor melalui core.dart
// extension RupiahFormatOnIntForPaymentDetail on int {
//   String get toRupiah {
//     if (this == 0) return 'Rp0';
//     return 'Rp${toString().replaceAllMapped(
//       RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
//       (match) => '${match[1]}.',
//     )}';
//   }
// }

class PaymentDetailPage extends StatelessWidget {
  const PaymentDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPaymentNotifier = ValueNotifier<BankAccountModel?>(null);

    final banks = [
      BankAccountModel(
        code: 'bri',
        name: 'BRI Virtual Account',
        image: Assets.images.banks.bri.path,
      ),
      BankAccountModel(
        code: 'bca',
        name: 'BCA Virtual Account',
        image: Assets.images.banks.bca.path,
      ),
      BankAccountModel(
        code: 'mandiri',
        name: 'Bank Mandiri VA',
        image: Assets.images.banks.mandiri.path,
      ),
      BankAccountModel(
        code: 'bni',
        name: 'BNI Virtual Account',
        image: Assets.images.banks.bni.path,
      ),
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
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.primary,
                        ),
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
          debugPrint('PaymentDetailPage - OrderBloc state changed: $state');
          if (state is DoOrderLoaded) {
            debugPrint(
                'PaymentDetailPage - Order successful, navigating to PaymentWaitingPage.');
            // Dapatkan 'root_tab' saat ini atau default ke '0'
            final currentPathParams = GoRouterState.of(context).pathParameters;
            final rootTabParam =
                currentPathParams[RouteConstants.pathParamRootTab] ?? '0';

            // Navigasi ke PaymentWaitingPage setelah order berhasil
            context.goNamed(
              RouteConstants.paymentWaiting,
              pathParameters: {
                RouteConstants.pathParamRootTab: rootTabParam,
                // Jika ada parameter path lain yang dibutuhkan oleh rute induk (orderDetail, paymentDetail),
                // tambahkan di sini. Berdasarkan AppRouter Anda, sepertinya tidak ada.
              },
              // Tidak perlu mengirim 'extra' jika PaymentWaitingPage mengambil data dari BlocProvider
            );
          } else if (state is DoOrderError) {
            debugPrint('PaymentDetailPage - Order error: ${state.message}');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Gagal memproses pesanan: ${state.message}'),
                  backgroundColor: Colors.red,
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          }
          // Anda bisa menangani DoOrderLoading di sini untuk menampilkan dialog loading global
          // jika tombol tidak di-disable.
        },
        child: ListView(
          padding: const EdgeInsets.all(20.0),
          children: [
            // Countdown timer mungkin tidak relevan di halaman ini sebelum pembayaran
            // Jika tetap ingin ada, pastikan fungsinya jelas.
            // Row(
            //   children: [
            //     const Icon(Icons.schedule),
            //     const SpaceWidth(12.0),
            //     const Flexible(
            //       child: Text(
            //         'Selesaikan Pembayaran Dalam',
            //         overflow: TextOverflow.ellipsis,
            //       ),
            //     ),
            //     const SpaceWidth(12.0),
            //     CountdownTimer(
            //       minute: 120,
            //       onTimerCompletion: () {},
            //     ),
            //   ],
            // ),
            // const SpaceHeight(30.0),

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
                    int totalProductPrice = 0;
                    int shippingCost = 0;
                    int totalBill = 0;

                    if (checkoutState is CheckoutLoaded) {
                      totalProductPrice = checkoutState.products.fold<int>(
                        0,
                        (sum, item) =>
                            sum + ((item.product.price ?? 0) * item.quantity),
                      );

                      if (checkoutState.shippingCost > 0) {
                        shippingCost = checkoutState.shippingCost;
                      } else if (costState is CostLoaded) {
                        final costs = costState.costResponseModel.rajaongkir
                            ?.results?.firstOrNull?.costs;
                        final firstCostValue =
                            costs?.firstOrNull?.cost?.firstOrNull?.value;
                        shippingCost = firstCostValue ?? 0;
                      }
                      totalBill = totalProductPrice + shippingCost;
                    }

                    return Column(
                      children: [
                        _priceRow('Total Harga (Produk)', totalProductPrice),
                        const SpaceHeight(5.0),
                        _priceRow('Total Ongkos Kirim', shippingCost),
                        const Divider(),
                        const SpaceHeight(8.0),
                        _priceRow('Total Tagihan', totalBill),
                      ],
                    );
                  },
                );
              },
            ),
            const SpaceHeight(30.0),
            BlocBuilder<OrderBloc, OrderState>(
              builder: (context, orderState) {
                return ValueListenableBuilder<BankAccountModel?>(
                  valueListenable: selectedPaymentNotifier,
                  builder: (context, selectedBankFromNotifier, _) {
                    final bool isDisabled = selectedBankFromNotifier == null ||
                        orderState is DoOrderLoading;
                    return Button.filled(
                      disabled: isDisabled,
                      onPressed: () {
                        // Fungsi buyNowTap sekarang ada di sini
                        if (isDisabled) return;

                        final checkoutState =
                            context.read<CheckoutBloc>().state;
                        final costState = context.read<CostBloc>().state;

                        if (checkoutState is CheckoutLoaded) {
                          final int addressId = checkoutState.addressId;
                          if (addressId == 0) {
                            // Validasi addressId
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Alamat pengiriman belum dipilih.')),
                              );
                            }
                            return;
                          }

                          final String paymentMethod = 'bank_transfer';
                          final String paymentVaName =
                              selectedBankFromNotifier.code;

                          int currentShippingCost = checkoutState.shippingCost;
                          String currentShippingService =
                              checkoutState.shippingService;

                          // Pastikan shipping cost dan service sudah ada jika ada produk
                          if (checkoutState.products.isNotEmpty) {
                            if (currentShippingCost == 0 &&
                                costState is CostLoaded) {
                              final costs = costState.costResponseModel
                                  .rajaongkir?.results?.firstOrNull?.costs;
                              currentShippingCost = costs
                                      ?.firstOrNull?.cost?.firstOrNull?.value ??
                                  0;
                              currentShippingService =
                                  costs?.firstOrNull?.service ??
                                      'Unknown Service';
                            }
                            if (currentShippingCost == 0 &&
                                currentShippingService.isEmpty) {
                              if (context.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Biaya atau layanan pengiriman belum ditentukan.')),
                                );
                              }
                              return;
                            }
                          }

                          final List<ProductQuantity> productsForOrder =
                              checkoutState.products.map((item) {
                            return ProductQuantity(
                                product: item.product, quantity: item.quantity);
                          }).toList();

                          if (productsForOrder.isEmpty) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Keranjang belanja Anda kosong.')),
                              );
                            }
                            return;
                          }

                          // Hitung subtotal dan totalCost di sini sebelum mengirim ke BLoC
                          int subtotal = 0;
                          for (var pq in productsForOrder) {
                            subtotal += (pq.product.price ?? 0) * pq.quantity;
                          }
                          int totalCost = subtotal + currentShippingCost;

                          debugPrint(
                              'PaymentDetailPage - Dispatching DoOrder event with:');
                          debugPrint('  addressId: $addressId');
                          debugPrint('  paymentMethod: $paymentMethod');
                          debugPrint(
                              '  shippingService: $currentShippingService');
                          debugPrint('  shippingCost: $currentShippingCost');
                          debugPrint('  paymentVaName: $paymentVaName');
                          debugPrint('  subtotal (calculated): $subtotal');
                          debugPrint('  totalCost (calculated): $totalCost');
                          debugPrint(
                              '  products count: ${productsForOrder.length}');

                          // Dispatch event DoOrder
                          context.read<OrderBloc>().add(DoOrder(
                                addressId: addressId,
                                paymentMethod: paymentMethod,
                                shippingService:
                                    currentShippingService, // Kirim service yang benar
                                shippingCost:
                                    currentShippingCost, // Kirim cost yang benar
                                paymentVaName: paymentVaName,
                                products: productsForOrder,
                                // subtotal dan totalCost akan dihitung oleh BLoC atau backend
                                // Jika BLoC Anda menghitungnya, pastikan sudah benar
                              ));
                        } else {
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('Data checkout tidak lengkap.')),
                            );
                          }
                        }
                      },
                      label: orderState is DoOrderLoading
                          ? 'MEMPROSES...'
                          : 'Bayar Sekarang',
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
