import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_app/data/datasources/auth_local_datasource.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../bloc/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
        children: [
          const Text(
            'Masuk Akun',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Halo, selamat datang kembali di akun kami',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(60.0),

          // Email
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email ID',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.email.svg(),
              ),
            ),
          ),
          const SpaceHeight(20.0),

          // Password dengan eye icon
          TextFormField(
            controller: passwordController,
            obscureText: !_isPasswordVisible,
            decoration: InputDecoration(
              labelText: 'Kata Sandi',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.password.svg(),
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
          const SpaceHeight(50.0),

          // BlocConsumer
          BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              switch (state) {
                case LoginLoded(:final authResponseModel):
                  AuthLocalDatasource().saveAuthData(authResponseModel);
                  context.goNamed(
                    RouteConstants.root,
                    pathParameters: PathParameters().toMap(),
                  );
                  break;

                case LoginError(:final message):
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
              switch (state) {
                case LoginLoading():
                  return const Center(
                    child: CircularProgressIndicator(),
                  );

                default:
                  return Button.filled(
                    onPressed: () {
                      context.read<LoginBloc>().add(
                            LoginEvent.login(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                    },
                    label: 'Masuk',
                  );
              }
            },
          ),

          const SpaceHeight(50.0),

          // Link ke register
          InkWell(
            onTap: () {
              context.goNamed(RouteConstants.register);
            },
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Belum Terdaftar? ',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'Buat Akun',
                    style: TextStyle(
                      color: AppColors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
