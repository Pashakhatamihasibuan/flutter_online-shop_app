import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/address_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/city_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/district_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/province_response_modal.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/city/city_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/district/district_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/province/province_bloc.dart';

import '../../../core/components/spaces.dart';
import '../../../core/core.dart';

class AddressTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return BlocBuilder<ProvinceBloc, ProvinceState>(
      builder: (context, provinceState) {
        return BlocBuilder<CityBloc, CityState>(
          builder: (context, cityState) {
            return BlocBuilder<DistrictBloc, DistrictState>(
              builder: (context, districtState) {
                final province = provinceState is ProvinceLoaded
                    ? provinceState.provinces.firstWhere(
                        (e) => e.code == data.provId,
                        orElse: () => Province(code: '', name: ''),
                      )
                    : Province(code: '', name: '');

                final city = cityState is CityLoaded
                    ? cityState.cities.firstWhere(
                        (e) => e.code == data.cityId,
                        orElse: () => City(code: '', name: ''),
                      )
                    : City(code: '', name: '');

                final district = districtState is DistrictLoaded
                    ? districtState.districts.firstWhere(
                        (e) => e.code == data.districtId,
                        orElse: () => District(code: '', name: ''),
                      )
                    : District(code: '', name: '');

                final addressDetail = [
                  data.fullAddress,
                  district.name,
                  city.name,
                  province.name,
                  data.postalCode,
                ].where((e) => e != null && e.isNotEmpty).join(', ');

                return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: AppColors.black.withOpacity(0.1),
                                blurRadius: 2,
                                offset: const Offset(0, 2),
                                spreadRadius: 0,
                                blurStyle: BlurStyle.outer,
                              ),
                            ]
                          : null,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SpaceHeight(24.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            '${data.name} - ${data.phone}',
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        const SpaceHeight(4.0),
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
                              const SpaceWidth(14.0),
                              Icon(
                                isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.circle_outlined,
                                color: isSelected
                                    ? AppColors.primary
                                    : AppColors.grey,
                              ),
                            ],
                          ),
                        ),
                        const SpaceHeight(24.0),
                        if (isSelected) ...[
                          const Divider(color: AppColors.primary),
                          Center(
                            child: TextButton(
                              onPressed: onEditTap,
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
      },
    );
  }
}
