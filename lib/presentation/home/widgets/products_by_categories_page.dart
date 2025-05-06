import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/product/product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/product_card.dart';

class ProductsByCategoryPage extends StatelessWidget {
  final Category category;

  const ProductsByCategoryPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name ?? 'Produk'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            final products = state.products;

            if (products.isEmpty) {
              return const Center(child: Text('Tidak ada produk.'));
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(data: products[index]);
                },
              ),
            );
          } else if (state is ProductError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
