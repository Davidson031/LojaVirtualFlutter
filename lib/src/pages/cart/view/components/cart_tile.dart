import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/pages/cart/controller/cart_controller.dart';
import 'package:quitanda_virtual/src/pages/common_widgets/quantity_widget.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';
import '../../../../config/custom_colors.dart';

class CartTile extends StatefulWidget {
  final CartItemModel cartItem;

  CartTile({super.key, required this.cartItem});

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  final UtilsServices utils = UtilsServices();
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Image.network(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItem.item.itemName,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        trailing: QuantityWidget(
          value: widget.cartItem.quantity,
          suffixText: widget.cartItem.item.unit,
          result: (quantity) {
            controller.changeItemQuantity(item: widget.cartItem, quantity: quantity);
          },
          isRemovable: true,
        ),
        subtitle: Text(
          utils.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor[900],
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
