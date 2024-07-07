import 'package:agri_plant/models/product.dart';
import 'package:agri_plant/utils/enums/order.dart';

class Order {
  final String id;
  final List<Product> products;
  final DateTime orderingDate;
  final DateTime deliveyDate;
  final OrderStatus status;

  Order({
    required this.id,
    required this.products,
    required this.orderingDate,
    required this.deliveyDate,
    required this.status,
  });
}
