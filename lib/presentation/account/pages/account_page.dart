import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/core.dart';
import '../../../core/router/app_router.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: ListView(
        children: [
          ListTile(
            // leading: Assets.icons.user.svg(),
            title: const Text(
              'Profil',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            // leading: Assets.icons.bag.svg(),
            title: const Text(
              'Pesanan',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              context.goNamed(
                RouteConstants.orderList,
                pathParameters: PathParameters(
                  rootTab: RootTab.account,
                ).toMap(),
              );
            },
          ),
          ListTile(
            leading: Assets.icons.location.svg(),
            title: const Text(
              'Alamat',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            // leading: Assets.icons.creditcard.svg(),
            title: const Text(
              'Pembayaran',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {},
          ),
          BlocConsumer<LogoutBloc, LogoutState>(
            listener: (context, state) {
              switch (state) {
                case LogoutSuccess():
                  context.goNamed(
                    RouteConstants.login,
                  );
                  break;

                case LogoutError(:final message):
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.red,
                    ),
                  );
                  break;
              }
            },
            builder: (context, state) {
              return ListTile(
                leading: const Icon(
                  Icons.login_outlined,
                  color: AppColors.primary,
                ),
                title: const Text(
                  'Keluar',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                onTap: () {
                  context.read<LogoutBloc>().add(const LogoutEvent.logout());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
