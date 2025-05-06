import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_onlineshop_app/presentation/address/bloc/address/address_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/checkout/checkout_bloc.dart';

import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../widgets/address_tile.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  int? selectedIndex;

  @override
  void initState() {
    super.initState();
    context.read<AddressBloc>().add(const AddressEvent.getAddress());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
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
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AddressLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AddressError) {
            return Center(child: Text(state.message));
          }

          if (state is AddressLoaded) {
            final addresses = state.addresses;

            // Set default index saat pertama kali
            if (selectedIndex == null && addresses.isNotEmpty) {
              final defaultIndex =
                  addresses.indexWhere((e) => e.isDefault == 1);
              selectedIndex = defaultIndex != -1 ? defaultIndex : 0;
            }

            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                const Text(
                  'Pilih atau tambahkan alamat pengiriman',
                  style: TextStyle(fontSize: 16),
                ),
                const SpaceHeight(20.0),

                if (addresses.isEmpty)
                  const Text("Belum ada alamat, silakan tambahkan."),

                if (addresses.isNotEmpty)
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: addresses.length,
                    itemBuilder: (context, index) => AddressTile(
                      isSelected: selectedIndex == index,
                      data: addresses[index],
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      onEditTap: () {
                        context.goNamed(
                          RouteConstants.editAddress,
                          pathParameters: {
                            ...PathParameters(rootTab: RootTab.order).toMap(),
                            'id': addresses[index]
                                .id
                                .toString(), // Tambahkan ID sebagai path parameter
                          },
                          extra: addresses[
                              index], // Tetap kirim modelnya jika diperlukan
                        );
                      },
                    ),
                    separatorBuilder: (_, __) => const SpaceHeight(16.0),
                  ),

                const SpaceHeight(40.0),

                // ✅ Tombol Tambah Alamat tetap ada
                Button.outlined(
                  onPressed: () {
                    context.goNamed(
                      RouteConstants.addAddress,
                      pathParameters: PathParameters(
                        rootTab: RootTab.order,
                      ).toMap(),
                    );
                  },
                  label: 'Add address',
                ),

                const SpaceHeight(50.0),
              ],
            );
          }

          return const SizedBox(); // Untuk AddressInitial
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if (state is CheckoutLoaded) {
              final total = state.products.fold<int>(
                0,
                (prev, item) => prev + (item.product.price! * item.quantity),
              );

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Subtotal (Estimasi)',
                          style: TextStyle(fontSize: 16.0)),
                      Text(
                        total.currencyFormatRp,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SpaceHeight(12.0),
                  Button.filled(
                    onPressed: () {
                      context.goNamed(
                        RouteConstants.orderDetail,
                        pathParameters: PathParameters(
                          rootTab: RootTab.order,
                        ).toMap(),
                      );
                    },
                    label: 'Lanjutkan',
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
