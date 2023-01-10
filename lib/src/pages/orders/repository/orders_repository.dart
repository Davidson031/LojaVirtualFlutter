import 'dart:developer';

import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/pages/orders/orders_result/orders_result.dart';

import '../../../models/cart_item_model.dart';
import '../../../models/order_model.dart';
import '../../../services/http_manager.dart';

class OrdersRepository {
  final _httpManager = HttpManager();

  Future<OrdersResult<List<OrderModel>>> getAllOrders(
      {required String userId, required String token}) async {
    final res = await _httpManager.restRequest(
        url: EndPoints.getAlOrders,
        method: HttpMethods.post,
        body: {
          "user": userId,
        },
        headers: {
          "X-Parse-Session-Token": token
        });

    if (res['result'] != null) {
      List<OrderModel> orders = List<Map<String, dynamic>>.from(res['result'])
          .map(OrderModel.fromJson)
          .toList();
      return OrdersResult<List<OrderModel>>.success(orders);
    } else {
      return OrdersResult.fail("Não foi possível recuperar os pedidos");
    }
  }

  Future<OrdersResult<List<CartItemModel>>> getOrderItems({required String token, required String orderId}) async {

    final res = await _httpManager.restRequest(
      url: EndPoints.getOrderItems,
      method: HttpMethods.post,
      headers: {
        "X-Parse-Session-Token" : token,
        
      },
      body: {
        "orderId": orderId,
      }
    );

    print(res['result'] == null);


    if(res['result'] != null){
      List<CartItemModel> items = List<Map<String, dynamic>>.from(res['result']).map(CartItemModel.fromJson).toList();
      return OrdersResult.success(items);
    } else {
      return OrdersResult.fail("Erro ao buscar itens do pedido");
    }
  }
}
