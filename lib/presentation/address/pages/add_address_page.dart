import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/models/requests/address_request_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_modal.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/district_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/district/district_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/address/address_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_dropdown.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';

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
  District? selectedDistrict;

  @override
  void initState() {
    super.initState();
    context.read<ProvinceBloc>().add(const GetProvinces(''));
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
            context.read<AddressBloc>().add(const AddressEvent.getAddress());
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

            /// Provinsi
            BlocBuilder<ProvinceBloc, ProvinceState>(
              builder: (context, state) {
                switch (state) {
                  case ProvinceLoading():
                    return const Center(child: CircularProgressIndicator());
                  case ProvinceLoaded():
                    final provinces = (state as ProvinceLoaded).provinces;
                    return CustomDropdown<Province>(
                      value: selectedProvince,
                      label: 'Provinsi',
                      items: provinces,
                      itemBuilder: (item) => item.name ?? '-',
                      onChanged: (value) {
                        setState(() {
                          selectedProvince = value;
                          selectedCity = null;
                          selectedDistrict = null;
                        });
                        if (value != null) {
                          context.read<CityBloc>().add(
                                GetCityByProvinceCode(value.code ?? ''),
                              );
                        }
                      },
                    );
                  case ProvinceError():
                    final msg = (state as ProvinceError).message;
                    return Text(
                      'Gagal memuat provinsi: $msg',
                      style: const TextStyle(color: Colors.red),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),

            const SpaceHeight(24),

            /// Kota/Kabupaten
            BlocBuilder<CityBloc, CityState>(
              builder: (context, state) {
                switch (state) {
                  case CityLoading():
                    return const Center(child: CircularProgressIndicator());
                  case CityLoaded():
                    final cities = (state as CityLoaded).cities;
                    return CustomDropdown<City>(
                      value: selectedCity,
                      label: 'Kota/Kabupaten',
                      items: cities,
                      itemBuilder: (item) => item.name ?? '-',
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                          selectedDistrict = null;
                        });
                        if (value != null) {
                          context.read<DistrictBloc>().add(
                                GetDistrictByRegencyCode(value.code ?? ''),
                              );
                        }
                      },
                    );
                  case CityError():
                    final msg = (state as CityError).message;
                    return Text(
                      'Gagal memuat kota: $msg',
                      style: const TextStyle(color: Colors.red),
                    );
                  default:
                    return const SizedBox.shrink();
                }
              },
            ),

            const SpaceHeight(24),

            /// Kecamatan
            BlocBuilder<DistrictBloc, DistrictState>(
              builder: (context, state) {
                switch (state) {
                  case DistrictLoading():
                    return const Center(child: CircularProgressIndicator());
                  case DistrictLoaded():
                    final districts = (state as DistrictLoaded).districts;
                    return CustomDropdown<District>(
                      value: selectedDistrict,
                      label: 'Kecamatan',
                      items: districts,
                      itemBuilder: (item) => item.name ?? '-',
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value;
                        });
                      },
                    );
                  case DistrictError():
                    final msg = (state as DistrictError).message;
                    return Text(
                      'Gagal memuat kecamatan: $msg',
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
                if (firstNameController.text.isEmpty ||
                    addressController.text.isEmpty ||
                    zipCodeController.text.isEmpty ||
                    phoneNumberController.text.isEmpty ||
                    selectedProvince == null ||
                    selectedCity == null ||
                    selectedDistrict == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Harap lengkapi semua data')),
                  );
                  return;
                }

                final request = AddressRequestModel(
                  name: firstNameController.text,
                  fullAddress: addressController.text,
                  provId: selectedProvince!.code!,
                  cityId: selectedCity!.code!,
                  districtId: selectedDistrict!.code!,
                  postalCode: zipCodeController.text,
                  phone: phoneNumberController.text,
                  isDefault: false,
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
