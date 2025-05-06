import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/category/category_bloc.dart';

import '../category_button.dart';

class MenuCategories extends StatefulWidget {
  const MenuCategories({super.key});

  @override
  State<MenuCategories> createState() => _MenuCategoriesState();
}

class _MenuCategoriesState extends State<MenuCategories> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(const CategoryEvent.getCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoaded) {
          final categories = state.categories;
          // Ambil maksimal 4 kategori
          final displayedCategories =
              categories.length > 4 ? categories.sublist(0, 4) : categories;
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: displayedCategories.map(
              (category) {
                return Expanded(
                  child: CategoryButton(
                    imagePath: category.image_url ?? '',
                    label: category.name ?? '',
                    onPressed: () {},
                  ),
                );
              },
            ).toList(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
