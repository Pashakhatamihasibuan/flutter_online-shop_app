import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../bloc/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
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
            'Daftar Akun',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Halo, mohon lengkapi data di bawah ini untuk mendaftar akun baru',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(50.0),
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

          // Nama Lengkap
          TextFormField(
            controller: nameController,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              labelText: 'Nama Lengkap',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.user.svg(),
              ),
            ),
          ),
          const SpaceHeight(20.0),

          // Nomor Telepon
          TextFormField(
            controller: phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Nomor Telepon',
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Assets.icons.phone.svg(),
              ),
            ),
          ),
          const SpaceHeight(20.0),
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
          BlocConsumer<RegisterBloc, RegisterState>(
            listener: (context, state) {
              switch (state.runtimeType) {
                case RegisterSuccess:
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Registrasi berhasil!'),
                      backgroundColor: Colors.green,
                    ),
                  );
                  context.goNamed(RouteConstants.login);
                  break;
                case RegisterError:
                  final errorState = state as RegisterError;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(errorState.message),
                      backgroundColor: Colors.red,
                    ),
                  );
                  break;
                default:
                  break;
              }
            },
            builder: (context, state) {
              final isLoading = state is RegisterLoading;
              return Button.filled(
                onPressed: () {
                  final name = nameController.text.trim();
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();
                  final phone = phoneController.text.trim();

                  context.read<RegisterBloc>().add(RegisterEvent.submit(
                        name: name,
                        email: email,
                        password: password,
                        phone: phone,
                        roles: 'user',
                      ));
                },
                label: isLoading ? 'Memproses...' : 'Daftar',
              );
            },
          ),
          const SpaceHeight(50.0),
          InkWell(
            onTap: () {
              context.goNamed(RouteConstants.login);
            },
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Sudah punya akun? ',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'Masuk',
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
