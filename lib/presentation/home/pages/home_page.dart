import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/alattulis/all_product_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/checkout/checkout_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/kantor/kantor_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/mewarnai/mewarnai_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/olahraga/olahraga_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/bloc/ulangtahun/ulangtahun_bloc.dart';
import 'package:flutter_onlineshop_app/presentation/home/widgets/banner_slider.dart';
import '../widgets/organism/product_list.dart';
import 'package:go_router/go_router.dart';
import '../../../core/assets/assets.gen.dart';
import '../../../core/components/search_input.dart';
import '../../../core/components/spaces.dart';
import '../../../core/router/app_router.dart';
import '../../../data/models/responses/category_response_model.dart';
import '../../../data/models/responses/product_response_model.dart';
import '../bloc/category/category_bloc.dart';
import '../widgets/organism/menu_categories.dart';
import '../widgets/title_content.dart';
import 'package:badges/badges.dart' as badges;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController searchController;
  bool _hasInitialized = false;

  final List<String> banners1 = [
    Assets.images.banner1.path,
    Assets.images.banner2.path,
  ];

  final List<String> banners2 = [
    Assets.images.banner2.path,
    Assets.images.banner2.path,
    Assets.images.banner2.path,
  ];

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_hasInitialized) {
      context.read<CheckoutBloc>().add(const CheckoutEvent.started());
      context.read<AllProductBloc>().add(const GetAllProducts());
      context.read<KantorBloc>().add(const GetKantor());
      context.read<MewarnaiBloc>().add(const GetMewarnai());
      context.read<OlahragaBloc>().add(const GetOlahraga());
      context.read<UlangtahunBloc>().add(const GetUlangtahun());

      _hasInitialized = true;
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Widget _buildBadgeCart(int quantity) {
    final icon = IconButton(
      onPressed: () {
        context.goNamed(RouteConstants.cart,
            pathParameters: PathParameters().toMap());
      },
      icon: Assets.icons.cart.svg(height: 24.0),
    );
    return quantity > 0
        ? badges.Badge(
            position: badges.BadgePosition.topEnd(top: 0, end: 0),
            badgeContent:
                Text('$quantity', style: const TextStyle(color: Colors.white)),
            child: icon,
          )
        : icon;
  }

  Widget _buildProductSection({
    required String title,
    required Category category,
    required List<Product> products,
  }) {
    return ProductList(
      title: title,
      items: products.length > 2 ? products.sublist(0, 2) : products,
      categories: [category],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asean Stationery'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.icons.notification.svg(height: 24.0),
          ),
          BlocBuilder<CheckoutBloc, CheckoutState>(
            builder: (context, state) {
              if (state is CheckoutLoaded) {
                final totalQty = state.products
                    .fold<int>(0, (sum, item) => sum + item.quantity);
                return _buildBadgeCart(totalQty);
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceWidth(8.0),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchInput(
            controller: searchController,
            onTap: () {
              context.pushReplacementNamed(
                RouteConstants.root,
                pathParameters:
                    PathParameters(rootTab: RootTab.explore).toMap(),
              );
            },
          ),
          const SpaceHeight(16.0),
          BannerSlider(items: banners1),
          const SpaceHeight(12.0),
          BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if (state is CategoryLoaded) {
                return TitleContent(
                  title: 'Kategori',
                  categories: state.categories,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceHeight(12.0),
          const MenuCategories(),
          const SpaceHeight(50.0),
          BlocBuilder<AllProductBloc, AllProductState>(
            builder: (context, state) {
              if (state is Loaded) {
                final category = Category(id: 1, name: 'Alat Tulis');
                return _buildProductSection(
                  title: category.name!,
                  category: category,
                  products: state.products,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceHeight(50.0),
          BannerSlider(items: banners2),
          const SpaceHeight(28.0),
          BlocBuilder<KantorBloc, KantorState>(
            builder: (context, state) {
              if (state is KantorLoaded) {
                final category = Category(id: 2, name: 'Alat Kantor');
                return _buildProductSection(
                  title: category.name!,
                  category: category,
                  products: state.products,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceHeight(28.0),
          BlocBuilder<OlahragaBloc, OlahragaState>(
            builder: (context, state) {
              if (state is OlahragaLoaded) {
                final category = Category(id: 3, name: 'Alat Olahraga');
                return _buildProductSection(
                  title: category.name!,
                  category: category,
                  products: state.products,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceHeight(28.0),
          BlocBuilder<MewarnaiBloc, MewarnaiState>(
            builder: (context, state) {
              if (state is MewarnaiLoaded) {
                final category = Category(id: 6, name: 'Alat Mewarnai');
                return _buildProductSection(
                  title: category.name!,
                  category: category,
                  products: state.products,
                );
              }
              return const SizedBox.shrink();
            },
          ),
          const SpaceHeight(28.0),
          BlocBuilder<UlangtahunBloc, UlangtahunState>(
            builder: (context, state) {
              if (state is UlangtahunLoaded) {
                final category = Category(id: 5, name: 'Alat Ulangtahun');
                return _buildProductSection(
                  title: category.name!,
                  category: category,
                  products: state.products,
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
