import 'package:agri_plant/data/products.dart';
import 'package:agri_plant/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartItems = products.take(4).toList();
    final totalPrice = cartItems.map((e) => e.price).reduce((acc, cur) {
      return acc + cur;
    });
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...List.generate(
            cartItems.length,
            (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: CartItem(
                  cartItem: cartItems[index],
                ),
              );
            },
          ),
          15.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total (${cartItems.length})"),
              Text(
                "\$$totalPrice",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ],
          ),
          20.heightBox,
          FilledButton.icon(
            onPressed: () {},
            icon: const Icon(
              IconlyBold.arrowRight,
            ),
            label: const Text(
              "Proceed to checkout",
            ),
          )
        ],
      ),
    );
  }
}
