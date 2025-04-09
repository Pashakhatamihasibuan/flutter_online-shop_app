import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';
import '../models/country_model.dart';
import '../widgets/select_type_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TypeLoginIs typeLogin = TypeLoginIs.phoneNumber;
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final countries = [
    CountryModel(
      name: 'Indonesia',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/0/0b/Flag_of_Indonesia.png',
      phoneCode: 62,
    ),
    CountryModel(
      name: 'Spanish',
      flag:
          'https://w7.pngwing.com/pngs/124/420/png-transparent-flag-of-spain-spanish-language-education-english-translation-spain-flag-miscellaneous-flag-text.png',
      phoneCode: 34,
    ),
    CountryModel(
      name: 'English',
      flag:
          'https://upload.wikimedia.org/wikipedia/commons/f/fc/Flag_of_Great_Britain_%28English_version%29.png',
      phoneCode: 44,
    ),
  ];
  late CountryModel selectedCountry;

  @override
  void initState() {
    selectedCountry = countries.first;
    super.initState();
  }

  @override
  void dispose() {
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
            'Login Account',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            'Hello, welcome back to our account',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SpaceHeight(50.0),
          SelectTypeLogin(
            typeLoginIs: typeLogin,
            onChanged: (value) {
              typeLogin = value;
              setState(() {});
            },
          ),
          if (typeLogin.isPhoneNumber) ...[
            const SpaceHeight(80.0),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Phone Number',
                prefixIcon: DropdownButton<CountryModel>(
                  value: selectedCountry,
                  items: countries.map<DropdownMenuItem<CountryModel>>(
                      (CountryModel country) {
                    return DropdownMenuItem<CountryModel>(
                      value: country,
                      child: Row(
                        children: [
                          Image.network(
                            country.flag,
                            width: 24.0,
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                          const SpaceWidth(10.0),
                          Text('+${country.phoneCode}'),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      final selected = value ?? selectedCountry;
                      selectedCountry = selected;
                    });
                  },
                ),
              ),
            ),
            const SpaceHeight(50.0),
            Button.filled(
              onPressed: () {
                context.goNamed(RouteConstants.verification);
              },
              label: 'Minta OTP',
            ),
          ] else if (typeLogin.isEmail) ...[
            const SpaceHeight(60.0),
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
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Assets.icons.password.svg(),
                ),
              ),
            ),
            const SpaceHeight(50.0),
            Button.filled(
              onPressed: () {
                context.goNamed(
                  RouteConstants.root,
                  pathParameters: PathParameters().toMap(),
                );
              },
              label: 'Login',
            ),
          ],
          const SpaceHeight(50.0),
          const Row(
            children: [
              Flexible(child: Divider()),
              SizedBox(width: 14.0),
              Text('OR'),
              SizedBox(width: 14.0),
              Flexible(child: Divider()),
            ],
          ),
          const SpaceHeight(50.0),
          Button.outlined(
            onPressed: () {},
            label: 'Login with Google',
            icon: Assets.images.google.image(height: 20.0),
          ),
          const SpaceHeight(50.0),
          InkWell(
            onTap: () {
              context.goNamed(RouteConstants.register);
            },
            child: const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Not Registered yet? ',
                    style: TextStyle(
                      color: AppColors.primary,
                    ),
                  ),
                  TextSpan(
                    text: 'Create an Account',
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
