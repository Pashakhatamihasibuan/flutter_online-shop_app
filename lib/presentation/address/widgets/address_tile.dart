import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_modal.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/province/province_bloc.dart';

class AddressTile extends StatefulWidget {
  final bool isSelected;
  final Address data;
  final VoidCallback onTap;
  final VoidCallback onEditTap;

  const AddressTile({
    super.key,
    required this.data,
    this.isSelected = false,
    required this.onTap,
    required this.onEditTap,
  });

  @override
  State<AddressTile> createState() => _AddressTileState();
}

class _AddressTileState extends State<AddressTile> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProvinceBloc, ProvinceState>(
      builder: (context, provinceState) {
        final province = switch (provinceState) {
          ProvinceLoaded(provinces: final provinces) => provinces.firstWhere(
              (e) => e.provinceId == widget.data.provId,
              orElse: () => Province(provinceId: '', province: ''),
            ),
          _ => Province(provinceId: '', province: ''),
        };

        return BlocBuilder<CityBloc, CityState>(
          builder: (context, cityState) {
            final city = switch (cityState) {
              CityLoaded(cities: final cities) => cities.firstWhere(
                  (e) => e.cityId == widget.data.cityId,
                  orElse: () => City(
                    cityId: '',
                    cityName: '',
                    provinceId: '',
                    province: '',
                    type: '',
                    postalCode: '',
                  ),
                ),
              _ => City(
                  cityId: '',
                  cityName: '',
                  provinceId: '',
                  province: '',
                  type: '',
                  postalCode: '',
                ),
            };

            final addressDetail = [
              widget.data.fullAddress,
              // district.subdistrictName,
              city.cityName,
              province.province,
              widget.data.postalCode,
            ].where((e) => e != null && e.isNotEmpty).join(', ');

            return GestureDetector(
              onTap: widget.onTap,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: widget.isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : null,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '${widget.data.name} - ${widget.data.phone}',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              addressDetail,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 14.0),
                          Icon(
                            widget.isSelected
                                ? Icons.radio_button_checked
                                : Icons.circle_outlined,
                            color:
                                widget.isSelected ? Colors.blue : Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    if (widget.isSelected) ...[
                      const Divider(color: Colors.blue),
                      Center(
                        child: TextButton(
                          onPressed: widget.onEditTap,
                          child: const Text('Edit'),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
