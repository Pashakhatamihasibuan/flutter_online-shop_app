import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';
import '../../../core/core.dart';
import '../../../core/router/app_router.dart';

class AllCategoriesPage extends StatelessWidget {
  final List<Category> categories;
  final Category? category;

  const AllCategoriesPage({
    Key? key,
    required this.categories,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category?.name ?? 'Semua Kategori'),
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final item = categories[index];
            return GestureDetector(
              onTap: () {
                // ✅ PERBAIKAN DI SINI:
                context.pushNamed(
                  RouteConstants.productsByCategory,
                  pathParameters: {
                    'root_tab': '0', // Jika kamu pakai bottom nav
                    'id': item.id.toString(),
                  },
                  extra: item, // ⬅️ Kirim data kategori yang diklik
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black.withOpacity(0.05),
                      blurRadius: 7,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        item.image_url ?? '',
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 100,
                          color: Colors.grey[300],
                          child: const Center(
                            child: Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.name ?? 'Tanpa Nama',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
