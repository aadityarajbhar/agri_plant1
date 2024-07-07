import 'package:agri_plant/data/products.dart';
import 'package:agri_plant/models/order.dart';
import 'package:agri_plant/utils/enums/order.dart';

List<Order> orders = [
  Order(
    id: "402aje5",
    products: products.reversed.take(3).toList(),
    orderingDate: DateTime.utc(2024, 6, 8),
    deliveyDate: DateTime(2024, 6, 9),
    status: OrderStatus.delivered,
  ),
  Order(
    id: "202204jm",
    products: products.reversed.take(1).toList(),
    orderingDate: DateTime.utc(2024, 6, 8),
    deliveyDate: DateTime(2024, 6, 9),
    status: OrderStatus.processing,
  ),
  Order(
    id: "2022w4fm",
    products: products.reversed.skip(3).toList(),
    orderingDate: DateTime.utc(2024, 8, 8),
    deliveyDate: DateTime(2024, 6, 4),
    status: OrderStatus.processing,
  ),
  Order(
    id: "203104jx",
    products: products.reversed.skip(3).toList(),
    orderingDate: DateTime.utc(2024, 6, 8),
    deliveyDate: DateTime(2024, 6, 9),
    status: OrderStatus.processing,
  ),
  Order(
    id: "112204bm",
    products: products.reversed.skip(3).take(2).toList(),
    orderingDate: DateTime.utc(2024, 6, 8),
    deliveyDate: DateTime(2024, 6, 9),
    status: OrderStatus.picking,
  ),
  Order(
    id: "402aje5",
    products: products.reversed.skip(3).take(2).toList(),
    orderingDate: DateTime.utc(2024, 3, 1),
    deliveyDate: DateTime(2024, 6, 3),
    status: OrderStatus.shipping,
  ),
];
