import 'package:agri_plant/models/order.dart';
import 'package:agri_plant/utils/enums/extensions/date.dart';
import 'package:agri_plant/utils/enums/order.dart';
import 'package:agri_plant/widgets/order_item.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:velocity_x/velocity_x.dart';

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const steps = OrderStatus.values;
    final activeStep = steps.indexOf(order.status);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Detail"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          EasyStepper(
            activeStep:
                activeStep == steps.length ? activeStep + 1 : activeStep,
            stepRadius: 8,
            activeStepTextColor: Colors.black87,
            finishedStepTextColor: theme.colorScheme.primary,
            lineStyle: LineStyle(
              defaultLineColor: Colors.grey.shade300,
              lineLength:
                  (MediaQuery.of(context).size.width * 0.7) / steps.length,
            ),
            steps: List.generate(
              steps.length,
              (index) {
                return EasyStep(
                  icon: const Icon(Icons.local_shipping),
                  finishIcon: const Icon(Icons.done),
                  title: steps[index].name,
                  topTitle: true,
                );
              },
            ),
          ),
          10.heightBox,
          Card(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order ${order.id}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Chip(
                          shape: const StadiumBorder(),
                          side: BorderSide.none,
                          backgroundColor:
                              theme.colorScheme.primaryContainer.withOpacity(
                            0.4,
                          ),
                          labelPadding: EdgeInsets.zero,
                          avatar: const Icon(
                            Icons.fire_truck,
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          label: Text(
                            steps[activeStep].name,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Delivery Estimate"),
                      Text(
                        order.deliveyDate.formatDate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  15.heightBox,
                  const Text(
                    "Aaditya Rajbhar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      const Icon(
                        IconlyLight.home,
                        size: 15,
                      ),
                      5.widthBox,
                      const Expanded(
                        child: Text(
                            "Uttam Nagar cidco nashik\n Maharashtra, India"),
                      )
                    ],
                  ),
                  5.heightBox,
                  Row(
                    children: [
                      const Icon(
                        IconlyLight.call,
                        size: 15,
                      ),
                      5.widthBox,
                      const Expanded(
                        child: Text("0987654321"),
                      ),
                    ],
                  ),
                  25.heightBox,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Payment Method"),
                      Text(
                        "Credit Card **1234",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          30.heightBox,
          OrderItem(
            order: order,
            visibleProduct: 1,
          ),
        ],
      ),
    );
  }
}
