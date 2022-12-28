import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;

import 'components/order_tile.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        physics: BouncingScrollPhysics(),
        separatorBuilder: ((context, index) => const SizedBox(height: 10)),
        itemBuilder: (context, index) => OrderTile(order: appData.orders[index]),
        itemCount: appData.orders.length,
      ),
    );
  }
}
