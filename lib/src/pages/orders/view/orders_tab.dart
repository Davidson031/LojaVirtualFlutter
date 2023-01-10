import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;
import 'package:quitanda_virtual/src/pages/orders/controller/all_orders_controller.dart';

import 'components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: GetBuilder<AllOrdersController>(
        builder: (controller) {
          return ListView.separated(
            padding: const EdgeInsets.all(16.0),
            physics: BouncingScrollPhysics(),
            separatorBuilder: ((context, index) => const SizedBox(height: 10)),
            itemBuilder: (context, index) =>
                OrderTile(order: controller.allOrders[index]),
            itemCount: controller.allOrders.length,
          );
        },
      ),
    );
  }
}
