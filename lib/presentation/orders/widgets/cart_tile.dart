import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../core/components/spaces.dart';
import '../../../core/core.dart';
import '../../home/bloc/checkout/checkout_bloc.dart';
import '../../home/models/product_quantity.dart';

class CartTile extends StatelessWidget {
  final ProductQuantity data;

  const CartTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (_) {
                context.read<CheckoutBloc>().add(
                      CheckoutEvent.removeItem(data.product),
                    );
              },
              backgroundColor: AppColors.primary.withOpacity(0.44),
              foregroundColor: AppColors.red,
              icon: Icons.delete_outlined,
              borderRadius: const BorderRadius.horizontal(
                right: Radius.circular(10.0),
              ),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.stroke),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                    child: Image.network(
                      data.product.imageUrl ?? '',
                      width: 68.0,
                      height: 68.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SpaceWidth(14.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.product.name ?? '',
                          style: const TextStyle(fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SpaceHeight(4.0),
                        Text(
                          data.product.price!.currencyFormatRp,
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _QuantityButton(
                    icon: Icons.remove,
                    onTap: () {
                      context.read<CheckoutBloc>().add(
                            CheckoutEvent.removeItem(data.product),
                          );
                    },
                  ),
                  const SpaceWidth(4.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${data.quantity}'),
                  ),
                  const SpaceWidth(4.0),
                  _QuantityButton(
                    icon: Icons.add,
                    onTap: () {
                      context.read<CheckoutBloc>().add(
                            CheckoutEvent.addItem(data.product),
                          );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuantityButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QuantityButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(5.0)),
      child: InkWell(
        onTap: onTap,
        child: ColoredBox(
          color: AppColors.primary,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(
              icon,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
