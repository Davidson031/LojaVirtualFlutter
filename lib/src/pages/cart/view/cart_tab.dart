import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;
import '../../common_widgets/payment_dialog.dart';
import '../controller/cart_controller.dart';
import 'components/cart_tile.dart';

class CartTab extends StatefulWidget {
  @override
  State<CartTab> createState() => _CartTabState();
}

class _CartTabState extends State<CartTab> {
  UtilsServices utils = UtilsServices();

  Future<bool?> showOrderConfirmation() {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmação"),
          content: Text("Deseja concluir o pedido?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Não"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text('Sim'),
            )
          ],
        );
      },
    );
  }

  void atualizarTotal() {
    setState(() {
      cartTotalPrice();
    });
  }

  double cartTotalPrice() {
    // double total = 0;
    // for (var cart in appData.cartItems) {
    //   total = total + cart.totalPrice();
    // }
    // return total;
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Carrinho",
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
              builder: (controller) {
                return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: (context, index) {
                    return CartTile(
                      cartItem: controller.cartItems[index],
                    );
                  },
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 3,
                      spreadRadius: 2)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Total geral",
                  style: TextStyle(fontSize: 12),
                ),
                GetBuilder<CartController>(
                  builder: (controller) {
                    return Text(
                      utils.priceToCurrency(controller.cartTotalPrice()),
                      style: TextStyle(
                        fontSize: 23,
                        color: CustomColors.customSwatchColor[900],
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      bool? res = await showOrderConfirmation();

                      if (res ?? false) {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return PaymentDialog(order: appData.orders.first);
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        primary: CustomColors.customSwatchColor[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18))),
                    child: const Text(
                      "Concluir pedido",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
