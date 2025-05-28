import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/datasources/product_remote_datasource.dart';
import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/product/product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/product_card.dart';

class CategoryProductPage extends StatelessWidget {
  final Category category;

  const CategoryProductPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc(ProductRemoteDatasource())
        ..add(GetProductByCategory(category.id!)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(category.name ?? 'Produk Kategori'),
          centerTitle: true,
        ),
        body: _buildProductList(),
      ),
    );
  }

  Widget _buildProductList() {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ProductLoaded) {
          final products = state.products;
          if (products.isEmpty) {
            return const Center(child: Text('Tidak ada produk tersedia.'));
          }

          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductCard(
                data: products[index],
              );
            },
          );
        }

        if (state is ProductError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline, size: 48, color: Colors.red),
                const SizedBox(height: 16),
                Text('Gagal memuat produk: ${state.message}'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => context.read<ProductBloc>().add(
                        GetProductByCategory(category.id!),
                      ),
                  child: const Text('Coba Lagi'),
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
