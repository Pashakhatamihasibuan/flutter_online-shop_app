import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../models/address_model.dart';
import '../widgets/address_tile.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<AddressModel> addresses = [
      AddressModel(
        country: 'Indonesia',
        firstName: 'Saiful',
        lastName: 'Bahri',
        address: 'Jl. Merdeka No. 123',
        city: 'Jakarta Selatan',
        province: 'DKI Jakarta',
        zipCode: 12345,
        phoneNumber: '08123456789',
        isPrimary: true,
      ),
      AddressModel(
        country: 'Indonesia',
        firstName: 'Saiful',
        lastName: '',
        address: 'Jl. Cendrawasih No. 456',
        city: 'Bandung',
        province: 'Jawa Barat',
        zipCode: 67890,
        phoneNumber: '08987654321',
      ),
    ];
    int selectedIndex = addresses.indexWhere((element) => element.isPrimary);

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
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          const Text(
            'Pilih atau tambahkan alamat pengiriman',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SpaceHeight(20.0),
          StatefulBuilder(
            builder: (context, setState) => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: addresses.length,
              itemBuilder: (context, index) => AddressTile(
                isSelected: selectedIndex == index,
                data: addresses[index],
                onTap: () {
                  selectedIndex = index;
                  setState(() {});
                },
                onEditTap: () {
                  context.goNamed(
                    RouteConstants.editAddress,
                    pathParameters: PathParameters(
                      rootTab: RootTab.order,
                    ).toMap(),
                    extra: addresses[index],
                  );
                },
              ),
              separatorBuilder: (context, index) => const SpaceHeight(16.0),
            ),
          ),
          const SpaceHeight(40.0),
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
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Subtotal (Estimasi)',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  20000.currencyFormatRp,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
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
        ),
      ),
    );
  }
}
