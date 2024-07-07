import 'package:agri_plant/models/order.dart';
import 'package:agri_plant/widgets/order_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order, this.visibleProduct = 2});
  final Order order;
  final int visibleProduct;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalPrice = order.products.fold(0.0, (acc, e) => acc + e.price);
    final products = order.products.take(visibleProduct).toList();
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        side: BorderSide(
          width: 0.2,
          color: Colors.grey.shade200,
        ),
      ),
      elevation: 0.1,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Order: ${order.id}",
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "(${order.products.length} Items)",
                  style: theme.textTheme.bodySmall,
                ),
                5.widthBox,
                Text("\$${totalPrice.toStringAsFixed(2)}"),
              ],
            ),
            20.heightBox,
            ...List.generate(
              products.length,
              (index) {
                return OrderProduct(
                  product: products[index],
                  order: order,
                );
              },
            ),
            if (order.products.length > 2)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextButton.icon(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      showDragHandle: true,
                      isScrollControlled: true,
                      builder: (context) {
                        return SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(14),
                            itemCount: order.products.length,
                            itemBuilder: (context, index) {
                              final product = order.products[index];
                              return OrderProduct(
                                order: order,
                                product: product,
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  label: const Text("View all"),
                  icon: const Icon(IconlyBold.arrowRight),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
