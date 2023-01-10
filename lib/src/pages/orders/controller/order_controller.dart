import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda_virtual/src/pages/orders/repository/orders_repository.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../../../models/cart_item_model.dart';
import '../../../models/order_model.dart';
import '../orders_result/orders_result.dart';

class OrderController extends GetxController {
  OrderModel order;

  OrderController(this.order);

  final orderRepository = OrdersRepository();
  final authController = Get.find<AuthController>();
  final UtilsServices utils = UtilsServices();

  Future<void> getOrderItems() async {
    final OrdersResult<List<CartItemModel>> res =
        await orderRepository.getOrderItems(
      token: authController.user.token!,
      orderId: order.id,
    );


    res.when(
      success: (data) {
        //atualizando as orders passadas por parametro com as orders recebidas do backend
        order.items = data;
        update();
      },
      fail: (message) {
        utils.showToast(message: message, isError: true);
      },
    );
  }
}
