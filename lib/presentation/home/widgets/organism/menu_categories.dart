import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../category_button.dart';

class MenuCategories extends StatelessWidget {
  const MenuCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: CategoryButton(
            imagePath: Assets.images.categories.menuBestseller.path,
            label: 'Bestseller',
            onPressed: () {},
          ),
        ),
        Flexible(
          child: CategoryButton(
            imagePath: Assets.images.categories.menuFlashsale.path,
            label: 'Flashsale',
            onPressed: () {},
          ),
        ),
        Flexible(
          child: CategoryButton(
            imagePath: Assets.images.categories.menuToprated.path,
            label: 'Toprated',
            onPressed: () {},
          ),
        ),
        Flexible(
          child: CategoryButton(
            imagePath: Assets.images.categories.menuMore.path,
            label: 'More',
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
