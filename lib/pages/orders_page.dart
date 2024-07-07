import 'package:agri_plant/data/orders.dart';
import 'package:agri_plant/utils/enums/order.dart';
import 'package:agri_plant/widgets/order_item.dart';

import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = OrderStatus.values.map((e) => e.name).toList();
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("My Orders"),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              tabs.length,
              (index) {
                return Tab(
                  text: tabs[index],
                );
              },
            ),
          ),
        ),
        body: TabBarView(
          children: List.generate(
            tabs.length,
            (index) {
              final filterdOrdrs = orders
                  .where(
                    (order) => order.status == OrderStatus.values[index],
                  )
                  .toList();
              return ListView.separated(
                padding: const EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  final order = filterdOrdrs[index];
                  return OrderItem(order: order);
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: filterdOrdrs.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
