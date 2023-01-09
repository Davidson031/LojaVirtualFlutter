import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../../models/item_model.dart';
import '../base/controller/navigation.controller.dart';
import '../common_widgets/quantity_widget.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen();

  ItemModel item = Get.arguments;

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final UtilsServices utils = UtilsServices();

  int cartItemQuantity = 1;

  final navigationController = Get.find<NavigationController>();

  final CartController cart = Get.find<CartController>();

  void alterQuantity(int qty) {
    setState(() {
      cartItemQuantity = qty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(230),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Hero(
                  tag: widget.item.imgUrl,
                  child: Image.network(
                    widget.item.imgUrl,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(50)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade600,
                            offset: const Offset(0, 2))
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              widget.item.itemName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 27, fontWeight: FontWeight.bold),
                            ),
                          ),
                          QuantityWidget(
                            suffixText: widget.item.unit,
                            value: cartItemQuantity,
                            result: alterQuantity,
                          ),
                        ],
                      ),
                      Text(
                        utils.priceToCurrency(widget.item.price),
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: CustomColors.customSwatchColor[900],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: SingleChildScrollView(
                            child: Text(
                              widget.item.description * 10,
                              style: const TextStyle(
                                height: 1.5,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.shopping_cart_outlined,
                            color: Colors.white,
                          ),
                          onPressed: () {

                            Get.back();

                            cart.addItemToCart(item: widget.item, quantity: cartItemQuantity);

                            navigationController.navigatePageView(NavigationTabs.cart);

                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          label: const Text(
                            "Adicionar ao carrinho",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 10,
            top: 10,
            child: SafeArea(
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
            ),
          )
        ],
      ),
    );
  }
}
