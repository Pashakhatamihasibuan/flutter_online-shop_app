import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_modal.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/address/address_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_dropdown.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
// Import SearchableDropdown component
import '../../../core/components/searchable_dropdown.dart'; // Adjust path as needed

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final firstNameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final provinceController = TextEditingController();
  final districtController = TextEditingController();
  final zipCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();

  Province? selectedProvince;
  City? selectedCity;
  // District? selectedDistrict;

  @override
  void initState() {
    super.initState();
    context.read<ProvinceBloc>().add(const GetProvinces());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAddressBloc, AddAddressState>(
      listener: (context, state) {
        switch (state) {
          case AddAddressLoading():
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const Center(child: CircularProgressIndicator()),
            );
            break;

          case AddAddressSuccess():
            Navigator.of(context).pop();
            context.read<AddressBloc>().add(const AddressEvent.getAddresses());
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Alamat berhasil ditambahkan')),
            );
            context.pop();
            break;

          case AddAddressError():
            Navigator.of(context).pop();
            final message = (state as AddAddressError).message;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal: $message')),
            );
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Tambah Alamat')),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            CustomTextField(
              controller: firstNameController,
              label: 'Nama Lengkap',
            ),
            const SpaceHeight(24),
            CustomTextField(
              controller: addressController,
              label: 'Alamat Lengkap',
            ),
            const SpaceHeight(24),

            /// Provinsi - Using SearchableDropdown
            BlocBuilder<ProvinceBloc, ProvinceState>(
              builder: (context, state) {
                switch (state) {
                  case ProvinceInitial():
                    return const SizedBox.shrink();
                  case ProvinceLoading():
                    return const Center(child: CircularProgressIndicator());
                  case ProvinceLoaded(provinces: final provinces):
                    return SearchableDropdown<Province>(
                      value: selectedProvince,
                      label: 'Provinsi',
                      items: provinces,
                      itemBuilder: (item) => item.province ?? '-',
                      searchBuilder: (item) =>
                          item.province ?? '-', // For better search
                      hintText: 'Cari provinsi...',
                      onChanged: (value) {
                        setState(() {
                          selectedProvince = value;
                          selectedCity = null;
                          // selectedDistrict = null;
                        });
                        if (value != null) {
                          context.read<CityBloc>().add(
                                CityEvent.getByProvinceId(
                                    value.provinceId ?? ''),
                              );
                        }
                      },
                    );
                  case ProvinceError(message: final message):
                    return Text(
                      'Gagal memuat provinsi: $message',
                      style: const TextStyle(color: Colors.red),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),

            const SpaceHeight(24),

            /// Kota/Kabupaten - You can also make this searchable
            BlocBuilder<CityBloc, CityState>(
              builder: (context, state) {
                switch (state) {
                  case CityInitial():
                    return const SizedBox.shrink();
                  case CityLoading():
                    return const Center(child: CircularProgressIndicator());
                  case CityLoaded(cities: final cities):
                    // Option 1: Keep as regular dropdown
                    return CustomDropdown<City>(
                      value: selectedCity,
                      label: 'Kota/Kabupaten',
                      items: cities,
                      itemBuilder: (item) => item.cityName ?? '-',
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                          // selectedDistrict = null;
                        });
                      },
                    );

                  // Option 2: Make it searchable too (uncomment to use)
                  // return SearchableDropdown<City>(
                  //   value: selectedCity,
                  //   label: 'Kota/Kabupaten',
                  //   items: cities,
                  //   itemBuilder: (item) => item.cityName ?? '-',
                  //   searchBuilder: (item) => item.cityName ?? '-',
                  //   hintText: 'Cari kota/kabupaten...',
                  //   onChanged: (value) {
                  //     setState(() {
                  //       selectedCity = value;
                  //       // selectedDistrict = null;
                  //     });
                  //   },
                  // );
                  case CityError(message: final message):
                    return Text(
                      'Gagal memuat kota: $message',
                      style: const TextStyle(color: Colors.red),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),
            const SpaceHeight(24),
            CustomTextField(
              controller: zipCodeController,
              label: 'Kode Pos',
            ),
            const SpaceHeight(24),
            CustomTextField(
              controller: phoneNumberController,
              label: 'No Handphone',
            ),
            const SpaceHeight(24),

            Button.filled(
              onPressed: () {
                // selectedDistrict == null
                if (firstNameController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    zipCodeController.text.isEmpty ||
                    phoneNumberController.text.isEmpty ||
                    selectedProvince == null ||
                    selectedCity == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Harap lengkapi semua data')),
                  );
                  return;
                }

                final request = AddressRequestModel(
                  name: firstNameController.text,
                  fullAddress: addressController.text,
                  provId: selectedProvince!.provinceId!,
                  cityId: selectedCity!.cityId!,
                  postalCode: zipCodeController.text,
                  phone: phoneNumberController.text,
                  isDefault: 0, // Default ke 0 (tidak utama)
                );

                context.read<AddAddressBloc>().add(AddAddress(request));
              },
              label: 'Tambah Alamat',
            ),
          ],
        ),
      ),
    );
  }
}
