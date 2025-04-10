import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/core.dart';
import '../../core/router/app_router.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => context.goNamed(
        RouteConstants.login,
        // pathParameters: PathParameters().toMap(),
      ),
    );

    return Scaffold(
      body: Opacity(
        opacity: 0.7,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                Color(0xFFDCB2DD),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Selamat Datang di',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'Asean Stationery',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 55.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Center(
                  child: Image.asset(
                    'assets/images/logo/logo.png',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
