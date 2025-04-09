import 'package:flutter/material.dart';

import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../home/models/product_model.dart';
import '../../home/models/store_model.dart';
import '../models/track_record_model.dart';
import '../widgets/product_tile.dart';
import '../widgets/tracking_horizontal.dart';

class TrackingOrderPage extends StatelessWidget {
  const TrackingOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> orders = [
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
    final List<TrackRecordModel> trackRecords = [
      TrackRecordModel(
        title: 'Pesanan Anda belum dibayar',
        status: TrackRecordStatus.belumBayar,
        isActive: true,
        updatedAt: DateTime.now().subtract(const Duration(days: 3)),
      ),
      TrackRecordModel(
        title: 'Pesanan Anda sedang disiapkan',
        status: TrackRecordStatus.dikemas,
        isActive: true,
        updatedAt: DateTime.now().subtract(const Duration(days: 2)),
      ),
      TrackRecordModel(
        title: 'Pesanan Anda dalam pengiriman',
        status: TrackRecordStatus.dikirim,
        isActive: true,
        updatedAt: DateTime.now().subtract(const Duration(days: 1)),
      ),
      TrackRecordModel(
        title: 'Pesanan Anda telah tiba',
        status: TrackRecordStatus.selesai,
        isActive: true,
        updatedAt: DateTime.now(),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Orders'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            itemBuilder: (context, index) => ProductTile(
              data: orders[index],
            ),
            separatorBuilder: (context, index) => const SpaceHeight(16.0),
          ),
          const SpaceHeight(40.0),
          TrackingHorizontal(trackRecords: trackRecords),
          const SpaceHeight(20.0),
          const Text(
            'Info Pengiriman',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SpaceHeight(20.0),
          const Text(
            'Alamat Pesanan',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const Text(
            'Lorem ipsum dolor sit amet. Zip Code 000000',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const SpaceHeight(16.0),
          const Text(
            'Penerima',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          const Text(
            'Fauzan Abdillah',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
