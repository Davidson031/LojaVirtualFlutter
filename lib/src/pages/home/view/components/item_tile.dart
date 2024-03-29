import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';
import 'package:quitanda_virtual/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda_virtual/src/routes/app_pages.dart';

import '../../../../services/utils_services.dart';
import '../../../product/product_screen.dart';

class ItemTile extends StatefulWidget {
  ItemModel item;
  final void Function(GlobalKey) cartAnimationMethod;
  ItemTile({required this.item, required this.cartAnimationMethod});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();
  IconData tileIcon = Icons.add_shopping_cart_outlined;
  UtilsServices utils = UtilsServices();
  final cartController = Get.find<CartController>();


  Future<void> switchIcon() async {
    setState(() {
      tileIcon = Icons.check;
    });

    await Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      setState(() {
        tileIcon = Icons.add_shopping_cart_outlined;
      });
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(PagesRoutes.productRoute, arguments: widget.item);
          },
          child: Card(
            elevation: 2,
            shadowColor: Colors.grey[300],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.item.imgUrl,
                      child: Image.network(
                        widget.item.imgUrl,
                        key: imageGk,
                      ),
                    ),
                  ),
                  Text(
                    widget.item.itemName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        utils.priceToCurrency(333),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: CustomColors.customSwatchColor[900],
                        ),
                      ),
                      Text(
                        ('/${widget.item.unit}'),
                        style: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  switchIcon();

                  cartController.addItemToCart(item: widget.item);

                  widget.cartAnimationMethod(imageGk);
                },
                child: Ink(
                  height: 40,
                  width: 35,
                  decoration: BoxDecoration(
                    color: CustomColors.customSwatchColor[900],
                  ),
                  child: Icon(
                    tileIcon,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
