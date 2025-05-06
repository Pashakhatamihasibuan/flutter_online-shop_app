import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/address_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasources/auth_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasources/category_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasources/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/datasources/register_remote_datasource.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/add_address/add_address_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/address/bloc/province/province_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/login/login_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/logout/logout_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/auth/bloc/register/register_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/alattulis/all_product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/category/category_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/kantor/kantor_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/colors.dart';
import 'core/router/app_router.dart';
import 'data/datasources/rajaongkir_remote_datasource.dart';
import 'presentation/address/bloc/address/address_bloc.dart';
import 'presentation/address/bloc/city/city_bloc.dart';
import 'presentation/address/bloc/district/district_bloc.dart';
import 'presentation/home/bloc/checkout/checkout_bloc.dart';
import 'presentation/home/bloc/mewarnai/mewarnai_bloc.dart';
import 'presentation/home/bloc/olahraga/olahraga_bloc.dart';
import 'presentation/home/bloc/product/product_bloc.dart';
import 'presentation/home/bloc/ulangtahun/ulangtahun_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    final router = appRouter.router;
    final rajaongkirDatasource = RajaongkirRemoteDatasource();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CategoryBloc(CategoryRemoteDatasource())),
        BlocProvider(create: (_) => AllProductBloc(ProductRemoteDatasource())),
        BlocProvider(create: (_) => KantorBloc(ProductRemoteDatasource())),
        BlocProvider(create: (_) => OlahragaBloc(ProductRemoteDatasource())),
        BlocProvider(create: (_) => MewarnaiBloc(ProductRemoteDatasource())),
        BlocProvider(create: (_) => UlangtahunBloc(ProductRemoteDatasource())),
        BlocProvider(create: (_) => CheckoutBloc()),
        BlocProvider(create: (_) => LoginBloc(AuthRemoteDatasource())),
        BlocProvider(create: (_) => LogoutBloc(AuthRemoteDatasource())),
        BlocProvider(
            create: (_) =>
                RegisterBloc(RegisterRemoteDatasource(client: http.Client()))),
        BlocProvider(create: (_) => ProductBloc(ProductRemoteDatasource())),
        BlocProvider(create: (_) => AddressBloc(AddressRemoteDatasource())),
        BlocProvider(create: (_) => AddAddressBloc(AddressRemoteDatasource())),

        // Wilayah - RajaOngkir
        BlocProvider(create: (_) => ProvinceBloc(rajaongkirDatasource)),
        BlocProvider(create: (_) => CityBloc(rajaongkirDatasource)),
        BlocProvider(create: (_) => DistrictBloc(rajaongkirDatasource)),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 255, 255)),
          textTheme: GoogleFonts.dmSansTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            color: AppColors.white,
            titleTextStyle: GoogleFonts.quicksand(
              color: AppColors.primary,
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
            ),
            iconTheme: const IconThemeData(color: AppColors.black),
            centerTitle: true,
            shape: Border(
              bottom: BorderSide(color: AppColors.black.withOpacity(0.05)),
            ),
          ),
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
