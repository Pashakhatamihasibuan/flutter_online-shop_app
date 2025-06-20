import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/responses/order_response_model.dart';
import '../bloc/order/order_bloc.dart';
import '../bloc/status_order/status_order_bloc.dart';
import '../widgets/countdown_timer.dart';

extension RupiahFormatOnInt on int {
  String get toRupiah {
    if (this == 0) return 'Rp0';
    return 'Rp${toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }
}

class PaymentWaitingPage extends StatefulWidget {
  const PaymentWaitingPage({
    super.key,
  });

  @override
  State<PaymentWaitingPage> createState() => _PaymentWaitingPageState();
}

class _PaymentWaitingPageState extends State<PaymentWaitingPage> {
  Timer? _paymentCheckTimer;
  Timer? _successDelayTimer;
  bool _isPaymentSuccessShown = false;

  @override
  void initState() {
    super.initState();
    _startPaymentStatusCheck();
  }

  @override
  void dispose() {
    _paymentCheckTimer?.cancel();
    _successDelayTimer?.cancel();
    super.dispose();
  }

  void _startPaymentStatusCheck() {
    final orderBloc = context.read<OrderBloc>();
    final statusOrderBloc = context.read<StatusOrderBloc>();

    // Check payment status every 10 seconds
    _paymentCheckTimer = Timer.periodic(const Duration(seconds: 10), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      // Get current order ID from OrderBloc state
      final currentState = orderBloc.state;
      String? orderId;

      if (currentState is DoOrderLoaded) {
        orderId = currentState.orderResponseModel.order?.id?.toString();
      }

      if (orderId != null && !_isPaymentSuccessShown) {
        statusOrderBloc.add(StatusOrderEvent.checkPaymentStatus(orderId));
      }
    });
  }

  void _showPaymentSuccessModal() {
    if (!mounted || _isPaymentSuccessShown) return;

    setState(() {
      _isPaymentSuccessShown = true;
    });

    // Cancel the payment check timer
    _paymentCheckTimer?.cancel();

    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      isDismissible: false,
      enableDrag: false,
      backgroundColor: AppColors.white,
      builder: (BuildContext modalContext) {
        return WillPopScope(
          onWillPop: () async => false, // Prevent back button
          child: Padding(
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
                const Text(
                  'Pembayaran Berhasil!',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SpaceHeight(20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 80,
                  ),
                ),
                const SpaceHeight(20.0),
                const Text(
                  'Pembayaran Anda telah berhasil diproses. Terima kasih atas pembelian Anda!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.grey,
                  ),
                ),
                const SpaceHeight(30.0),
                Row(
                  children: [
                    Flexible(
                      child: Button.outlined(
                        onPressed: () {
                          Navigator.of(modalContext).pop();
                          // Navigate to order tracking
                          final orderBloc = context.read<OrderBloc>();
                          final currentState = orderBloc.state;
                          String? orderId;

                          if (currentState is DoOrderLoaded) {
                            orderId = currentState.orderResponseModel.order?.id
                                ?.toString();
                          }

                          if (orderId != null) {
                            context.pushNamed(
                              RouteConstants.trackingOrder,
                              pathParameters: {
                                RouteConstants.pathParamOrderId: orderId,
                              },
                            );
                          } else {
                            context.goNamed(RouteConstants.orderList);
                          }
                        },
                        label: 'Lihat Pesanan',
                      ),
                    ),
                    const SpaceWidth(12.0),
                    Flexible(
                      child: Button.filled(
                        onPressed: () {
                          Navigator.of(modalContext).pop();
                          context.goNamed(RouteConstants.root, pathParameters: {
                            RouteConstants.pathParamRootTab: '0'
                          });
                        },
                        label: 'Kembali ke Home',
                      ),
                    ),
                  ],
                ),
                const SpaceHeight(20.0),
              ],
            ),
          ),
        );
      },
    );
  }

  String _getBankDisplayName(String? bankCode) {
    if (bankCode == null || bankCode.isEmpty) return 'Virtual Account';
    switch (bankCode.toLowerCase()) {
      case 'bca':
        return 'BCA Virtual Account';
      case 'bri':
        return 'BRI Virtual Account';
      case 'bni':
        return 'BNI Virtual Account';
      case 'mandiri':
        return 'Mandiri Virtual Account / Bill';
      default:
        if (bankCode.length > 1) {
          return '${bankCode[0].toUpperCase()}${bankCode.substring(1).toLowerCase()} Virtual Account';
        }
        return '${bankCode.toUpperCase()} Virtual Account';
    }
  }

  AssetGenImage? _getBankIconAsset(String? bankCode) {
    if (bankCode == null || bankCode.isEmpty) return null;
    switch (bankCode.toLowerCase()) {
      case 'bca':
        return Assets.images.banks.bca;
      case 'bri':
        return Assets.images.banks.bri;
      case 'bni':
        return Assets.images.banks.bni;
      case 'mandiri':
        return Assets.images.banks.mandiri;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    String? orderIdForNav;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menunggu Pembayaran'),
      ),
      body: MultiBlocListener(
        listeners: [
          // Listen to StatusOrderBloc for payment status changes
          BlocListener<StatusOrderBloc, StatusOrderState>(
            listener: (context, state) {
              if (state is StatusOrderLoaded && !_isPaymentSuccessShown) {
                debugPrint('Payment status received: ${state.status}');

                if (state.status.toLowerCase() == 'paid') {
                  debugPrint('Payment is paid! Starting 5-second delay...');

                  // Wait 5 seconds before showing success modal
                  _successDelayTimer = Timer(const Duration(seconds: 5), () {
                    if (mounted) {
                      debugPrint('5 seconds passed, showing success modal');
                      _showPaymentSuccessModal();
                    }
                  });
                }
              } else if (state is StatusOrderError) {
                debugPrint('Error checking payment status: ${state.message}');
              }
            },
          ),
        ],
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state) {
            debugPrint('PaymentWaitingPage - OrderBloc state: $state');

            String paymentMethodDisplayName = 'Memuat data...';
            String vaNumber = '-';
            AssetGenImage? bankIcon;
            String formattedTotalAmount = (0).toRupiah;
            int countdownMinute = 1;
            Order? orderData;

            switch (state) {
              case DoOrderLoaded loadedState:
                orderData = loadedState.orderResponseModel.order;
                debugPrint(
                    'PaymentWaitingPage - OrderData from LoadedState: ID: ${orderData?.id}, VA Name: ${orderData?.paymentVaName}, VA Num: ${orderData?.paymentVaNumber}');
                if (orderData != null) {
                  orderIdForNav = orderData.id?.toString();
                  formattedTotalAmount = (orderData.totalCost ?? 0).toRupiah;
                  countdownMinute =
                      orderData.paymentMethod?.toLowerCase() == 'bank_transfer'
                          ? 59
                          : 10;

                  if (orderData.paymentMethod?.toLowerCase() ==
                      'bank_transfer') {
                    paymentMethodDisplayName =
                        _getBankDisplayName(orderData.paymentVaName);
                    bankIcon = _getBankIconAsset(orderData.paymentVaName);
                    vaNumber = orderData.paymentVaNumber ?? '-';
                    if (vaNumber == '-' || vaNumber.isEmpty) {
                      debugPrint(
                          '⚠️ PaymentWaitingPage - WARNING: VA Number is empty for bank transfer.');
                      vaNumber = 'VA Number tidak tersedia';
                    }
                  } else if (orderData.paymentMethod != null) {
                    paymentMethodDisplayName = orderData.paymentMethod!;
                    vaNumber =
                        'Selesaikan pembayaran melalui ${orderData.paymentMethod}';
                    bankIcon = null;
                  } else {
                    paymentMethodDisplayName =
                        'Metode Pembayaran Tidak Diketahui';
                  }
                } else {
                  paymentMethodDisplayName =
                      'Gagal memuat detail pesanan (orderData is null in LoadedState).';
                  debugPrint(
                      'PaymentWaitingPage - CRITICAL: DoOrderLoaded but orderData is null.');
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.error_outline,
                              color: Colors.orange, size: 48),
                          const SpaceHeight(16.0),
                          const Text(
                            'Data Pesanan Tidak Lengkap',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          const SpaceHeight(8.0),
                          const Text(
                            'Tidak dapat menampilkan detail pembayaran saat ini.',
                            textAlign: TextAlign.center,
                          ),
                          const SpaceHeight(24.0),
                          Button.filled(
                            width: MediaQuery.of(context).size.width * 0.6,
                            onPressed: () {
                              context.goNamed(RouteConstants.root,
                                  pathParameters: {
                                    RouteConstants.pathParamRootTab: '0',
                                  });
                            },
                            label: 'Kembali ke Beranda',
                          ),
                        ],
                      ),
                    ),
                  );
                }
                break;
              case DoOrderLoading _:
              case DoOrderInitial _:
                debugPrint(
                    'PaymentWaitingPage - State is Loading or Initial. Showing loading UI.');
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SpaceHeight(16.0),
                      Text('Memuat detail pembayaran...'),
                    ],
                  ),
                );
              case DoOrderError errorState:
                debugPrint(
                    'PaymentWaitingPage - OrderBloc Error: ${errorState.message}');
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error_outline,
                            color: Colors.red, size: 48),
                        const SpaceHeight(16.0),
                        Text(
                          'Gagal Memuat Pesanan',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SpaceHeight(8.0),
                        Text(
                          errorState.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.redAccent),
                        ),
                        const SpaceHeight(24.0),
                        Button.filled(
                          width: MediaQuery.of(context).size.width * 0.6,
                          onPressed: () {
                            context
                                .goNamed(RouteConstants.root, pathParameters: {
                              RouteConstants.pathParamRootTab: '0',
                            });
                          },
                          label: 'Kembali ke Beranda',
                        ),
                      ],
                    ),
                  ),
                );
            }

            if (orderData == null) {
              debugPrint(
                  'PaymentWaitingPage - orderData is null before building ListView. State was: $state');
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.info_outline, color: Colors.orange, size: 48),
                    SpaceHeight(16),
                    Text('Terjadi masalah saat memuat data pesanan.'),
                  ],
                ),
              );
            }

            void onTimerCompletion() {
              if (!context.mounted) return;
              showModalBottomSheet(
                context: context,
                useSafeArea: true,
                isScrollControlled: true,
                backgroundColor: AppColors.white,
                builder: (BuildContext modalContext) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 14.0),
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
                              'Waktu Pembayaran Habis',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: AppColors.light,
                              child: IconButton(
                                onPressed: () =>
                                    Navigator.of(modalContext).pop(),
                                icon: const Icon(Icons.close,
                                    color: AppColors.primary),
                              ),
                            ),
                          ],
                        ),
                        const SpaceHeight(20.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Assets.images.processOrder.image(),
                        ),
                        const SpaceHeight(16.0),
                        const Text(
                          'Waktu untuk menyelesaikan pembayaran telah habis. Silakan buat pesanan baru jika Anda masih menginginkan item ini.',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SpaceHeight(30.0),
                        Row(
                          children: [
                            Flexible(
                              child: Button.outlined(
                                onPressed: () {
                                  Navigator.of(modalContext).pop();
                                  final currentOrderId = orderIdForNav;
                                  if (currentOrderId != null) {
                                    context.pushNamed(
                                      RouteConstants.trackingOrder,
                                      pathParameters: {
                                        RouteConstants.pathParamOrderId:
                                            currentOrderId,
                                      },
                                    );
                                  } else {
                                    context.goNamed(RouteConstants.orderList);
                                  }
                                },
                                label: 'Lihat Pesanan',
                              ),
                            ),
                            const SpaceWidth(20.0),
                            Flexible(
                              child: Button.filled(
                                onPressed: () {
                                  Navigator.of(modalContext).pop();
                                  context.goNamed(RouteConstants.root,
                                      pathParameters: {
                                        RouteConstants.pathParamRootTab: '0'
                                      });
                                },
                                label: 'Kembali ke Home',
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

            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                Row(
                  children: [
                    const Icon(Icons.schedule, color: AppColors.primary),
                    const SpaceWidth(12.0),
                    const Flexible(
                      child: Text(
                        'Selesaikan Pembayaran Dalam',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                    const SpaceWidth(12.0),
                    CountdownTimer(
                      minute: countdownMinute,
                      onTimerCompletion: onTimerCompletion,
                    ),
                  ],
                ),
                const SpaceHeight(24.0),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: AppColors.primary),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 3),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              paymentMethodDisplayName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColors.black,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          if (bankIcon != null)
                            bankIcon.image(height: 28.0)
                          else
                            const SizedBox(height: 28.0, width: 60),
                        ],
                      ),
                      const SpaceHeight(16.0),
                      const Divider(color: AppColors.primary),
                      const SpaceHeight(16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderData.paymentMethod?.toLowerCase() ==
                                              'bank_transfer' &&
                                          vaNumber != '-' &&
                                          vaNumber != 'VA Number tidak tersedia'
                                      ? 'Nomor Virtual Account'
                                      : 'Detail Instruksi',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.grey,
                                  ),
                                ),
                                const SpaceHeight(4.0),
                                Text(
                                  vaNumber,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (orderData.paymentMethod?.toLowerCase() ==
                                  'bank_transfer' &&
                              vaNumber != '-' &&
                              vaNumber.isNotEmpty &&
                              vaNumber != 'VA Number tidak tersedia')
                            Button.outlined(
                              textColor: AppColors.primary,
                              height: 40,
                              fontSize: 14,
                              width: 120.0,
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: vaNumber))
                                    .then((_) {
                                  if (context.mounted) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          Text('Nomor VA berhasil disalin'),
                                      duration: Duration(seconds: 1),
                                      backgroundColor: AppColors.primary,
                                    ));
                                  }
                                });
                              },
                              label: 'Salin',
                              icon: const Icon(Icons.copy,
                                  size: 16, color: AppColors.primary),
                            ),
                        ],
                      ),
                      const SpaceHeight(20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total Pembayaran',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey,
                            ),
                          ),
                          Text(
                            formattedTotalAmount,
                            style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SpaceHeight(24.0),
                if (orderData.paymentMethod?.toLowerCase() == 'bank_transfer')
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Text(
                      'Segera lakukan pembayaran ke nomor Virtual Account di atas sebelum waktu habis untuk menghindari pembatalan otomatis.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12, color: AppColors.primary),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Button.filled(
              onPressed: () {
                context.goNamed(RouteConstants.root, pathParameters: {
                  RouteConstants.pathParamRootTab: '0',
                });
              },
              label: 'Belanja Lagi',
            ),
            const SpaceHeight(12.0),
            Button.outlined(
              onPressed: () {
                final currentState = context.read<OrderBloc>().state;
                String? currentOrderIdFromState;

                switch (currentState) {
                  case DoOrderLoaded loadedState:
                    currentOrderIdFromState =
                        loadedState.orderResponseModel.order?.id?.toString();
                    break;
                  default:
                    currentOrderIdFromState = null;
                }

                final orderIdToUse = orderIdForNav ?? currentOrderIdFromState;

                if (orderIdToUse != null) {
                  context.pushNamed(
                    RouteConstants.trackingOrder,
                    pathParameters: {
                      RouteConstants.pathParamOrderId: orderIdToUse,
                    },
                  );
                } else {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                          'Order ID tidak ditemukan untuk pelacakan. Mohon tunggu hingga data pesanan dimuat.'),
                      backgroundColor: AppColors.red,
                    ));
                  }
                }
              },
              label: 'Cek Status Pembayaran',
            ),
          ],
        ),
      ),
    );
  }
}
