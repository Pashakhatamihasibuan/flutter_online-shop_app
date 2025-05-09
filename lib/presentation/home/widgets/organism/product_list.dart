import 'package:flutter/material.dart';
import 'package:flutter_onlineshop_app/data/models/responses/product_response_model.dart';
import 'package:flutter_onlineshop_app/data/models/responses/category_response_model.dart';
import '../../../../core/components/spaces.dart';
import '../product_card.dart';
import '../title_content.dart';

class ProductList extends StatelessWidget {
  final String title;
  final List<Product> items;
  final List<Category> categories;

  const ProductList({
    Key? key,
    required this.title,
    required this.items,
    required this.categories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleContent(
          title: title,
          categories: categories,
        ),
        const SpaceHeight(20.0),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 55.0,
            childAspectRatio: 0.7,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) => ProductCard(data: items[index]),
        ),
      ],
    );
  }
}
