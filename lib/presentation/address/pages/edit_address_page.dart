import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/address/address_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';

class EditAddressPage extends StatelessWidget {
  final int addressId; // Kirim ID untuk cari data dari API
  const EditAddressPage({super.key, required this.addressId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Alamat')),
      body: BlocBuilder<AddressBloc, AddressState>(
        builder: (context, state) {
          if (state is AddressLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AddressLoaded) {
            final address =
                state.addresses.firstWhere((e) => e.id == addressId);
            final firstNameController =
                TextEditingController(text: address.name);
            final addressController =
                TextEditingController(text: address.fullAddress);
            final zipCodeController =
                TextEditingController(text: address.postalCode ?? '');
            final phoneNumberController =
                TextEditingController(text: address.phone ?? '');

            return ListView(
              padding: const EdgeInsets.all(20.0),
              children: [
                CustomTextField(
                  controller: firstNameController,
                  label: 'Nama Depan',
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: addressController,
                  label: 'Alamat jalan',
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: zipCodeController,
                  label: 'Kode Pos',
                ),
                const SpaceHeight(24.0),
                CustomTextField(
                  controller: phoneNumberController,
                  label: 'No Handphone',
                ),
                const SpaceHeight(24.0),
                Button.filled(
                  onPressed: () {
                    context.pop();
                  },
                  label: 'Perbarui Alamat',
                ),
              ],
            );
          }

          if (state is AddressError) {
            return Center(child: Text('Gagal memuat alamat: ${state.message}'));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
