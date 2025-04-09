import 'package:flutter/material.dart';

import '../../../core/core.dart';

enum TypeLoginIs {
  phoneNumber,
  email;

  bool get isPhoneNumber => this == TypeLoginIs.phoneNumber;
  bool get isEmail => this == TypeLoginIs.email;
}

class SelectTypeLogin extends StatelessWidget {
  final TypeLoginIs typeLoginIs;
  final void Function(TypeLoginIs value) onChanged;

  const SelectTypeLogin({
    super.key,
    required this.typeLoginIs,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      width: double.infinity,
      height: 56,
      decoration: ShapeDecoration(
        color: AppColors.bgLogin,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => onChanged(TypeLoginIs.phoneNumber),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: typeLoginIs.isPhoneNumber ? AppColors.white : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: GestureDetector(
              onTap: () => onChanged(TypeLoginIs.email),
              child: Container(
                width: double.infinity,
                decoration: ShapeDecoration(
                  color: typeLoginIs.isEmail ? AppColors.white : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
