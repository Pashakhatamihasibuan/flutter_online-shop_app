import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/product_remote_datasource.dart';
import '../../../data/models/responses/category_response_model.dart';
import '../../../presentation/home/bloc/product/product_bloc.dart';

class CategoryProductPage extends StatelessWidget {
  final Category category;

  const CategoryProductPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc(ProductRemoteDatasource())
        ..add(GetProductByCategory(category.id!)),
      child: Scaffold(
        appBar: AppBar(title: Text(category.name ?? 'Kategori')),
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case ProductLoading:
                return const Center(child: CircularProgressIndicator());
              case ProductLoaded:
                final products = (state as ProductLoaded).products;
                if (products.isEmpty) {
                  return const Center(child: Text('Produk tidak ditemukan.'));
                }
                return GridView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: product.imageUrl != null
                                ? Image.network(
                                    product.imageUrl!,
                                    fit: BoxFit.cover,
                                  )
                                : const Center(child: Icon(Icons.image)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(product.name ?? 'Tanpa nama'),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                                'Rp ${product.price?.toStringAsFixed(0) ?? '0'}'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              case ProductError:
                final message = (state as ProductError).message;
                return Center(child: Text('Terjadi kesalahan: $message'));
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
