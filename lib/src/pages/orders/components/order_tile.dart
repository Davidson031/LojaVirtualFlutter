import 'package:flutter/material.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../../common_widgets/payment_dialog.dart';
import 'order_status_widget.dart';

class OrderTile extends StatelessWidget {
  final OrderModel order;

  final UtilsServices utils = UtilsServices();

  OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Pedido: ${order.id}"),
              Text(
                utils.formatDateTime(order.createdDateTime),
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          children: [
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((e) {
                          return _OrderItemWidget(utils: utils, orderItem: e);
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 1.5,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(DateTime.now()),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(style: const TextStyle(fontSize: 20), children: [
                const TextSpan(
                    text: 'Total: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                    text: utils.priceToCurrency(order.total),
                    style: const TextStyle(fontWeight: FontWeight.bold)),
              ]),
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: ElevatedButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx){
                      return PaymentDialog(order: order);
                    },
                  );
                },
                icon: Image.asset(
                  "assets/app_images/pix.png",
                  height: 18,
                ),
                label: const Text("Ver QR Code do Pix"),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget(
      {Key? key, required this.utils, required this.orderItem})
      : super(key: key);

  final UtilsServices utils;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(orderItem.item.itemName),
          ),
          Text(utils.priceToCurrency(orderItem.totalPrice()))
        ],
      ),
    );
  }
}
