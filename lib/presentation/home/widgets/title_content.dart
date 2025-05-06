import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_app/core/router/app_router.dart';
import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';

class TitleContent extends StatelessWidget {
  final String title;
  final List<Category>? categories;
  final Category? category;

  const TitleContent({
    super.key,
    required this.title,
    this.categories,
    this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
        InkWell(
          onTap: () {
            if (categories != null) {
              // 👉 Buka halaman semua kategori
              context.pushNamed(
                RouteConstants.allCategories,
                pathParameters: {'root_tab': '0'},
                extra: categories,
              );
            } else if (category != null) {
              // 👉 Buka halaman produk berdasarkan kategori
              context.goNamed(
                'products-by-category',
                pathParameters: {
                  'root_tab': '0',
                  'id': category!.id.toString(),
                },
                extra: category,
              );
            }
          },
          child: const Text(
            'Lihat Semua',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
