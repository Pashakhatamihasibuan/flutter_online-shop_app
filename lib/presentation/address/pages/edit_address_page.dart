import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/address/address_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';

class EditAddressPage extends StatefulWidget {
  final int addressId;
  const EditAddressPage({super.key, required this.addressId});

  @override
  State<EditAddressPage> createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  late TextEditingController firstNameController;
  late TextEditingController addressController;
  late TextEditingController zipCodeController;
  late TextEditingController phoneNumberController;

  bool isDefault = false;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    addressController = TextEditingController();
    zipCodeController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    addressController.dispose();
    zipCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void _populateControllers(Address address) {
    firstNameController.text = address.name ?? '';
    addressController.text = address.fullAddress ?? '';
    zipCodeController.text = address.postalCode ?? '';
    phoneNumberController.text = address.phone ?? '';
    isDefault = address.isDefault == 1; // ← Tambahkan ini
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Alamat')),
      body: BlocListener<AddressBloc, AddressState>(
        listener: (context, state) {
          if (state is AddressUpdated) {
            context.pop(); // Tutup halaman setelah update sukses
          } else if (state is AddressError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<AddressBloc, AddressState>(
          builder: (context, state) {
            if (state is AddressLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is AddressLoaded) {
              final address =
                  state.addresses.firstWhere((e) => e.id == widget.addressId);

              if (firstNameController.text.isEmpty) {
                _populateControllers(address);
              }

              return ListView(
                padding: const EdgeInsets.all(20.0),
                children: [
                  CustomTextField(
                    controller: firstNameController,
                    label: 'Nama Depan',
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: addressController,
                    label: 'Alamat jalan',
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: zipCodeController,
                    label: 'Kode Pos',
                  ),
                  const SizedBox(height: 24),
                  CustomTextField(
                    controller: phoneNumberController,
                    label: 'No Handphone',
                  ),
                  const SizedBox(height: 24),
                  Button.filled(
                    onPressed: () {
                      context.read<AddressBloc>().add(
                            AddressEvent.updateAddresses(
                              id: widget.addressId,
                              name: firstNameController.text,
                              fullAddress: addressController.text,
                              postalCode: zipCodeController.text,
                              phone: phoneNumberController.text,
                              provId: address.provId!,
                              cityId: address.cityId!,
                              isDefault: address.isDefault ?? 0,
                            ),
                          );
                    },
                    label: 'Perbarui Alamat',
                  ),
                ],
              );
            }

            if (state is AddressError) {
              return Center(
                  child: Text('Gagal memuat alamat: ${state.message}'));
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
