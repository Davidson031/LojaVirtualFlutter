import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/pages/orders/orders_result/orders_result.dart';

import '../../../models/order_model.dart';
import '../../../services/http_manager.dart';

class OrdersRepository {
  final _httpManager = HttpManager();

  Future<OrdersResult<List<OrderModel>>> getAllOrders({required String userId, required String token}) async {
    final res = await _httpManager.restRequest(
      url: EndPoints.getAlOrders,
      method: HttpMethods.post,
      body: {
        "user" : userId,
      },
      headers: {
        "X-Parse-Session-Token" : token
      }
    );

    if(res['result'] != null){
      List<OrderModel> orders = List<Map<String, dynamic>>.from(res['result']).map(OrderModel.fromJson).toList();
      return OrdersResult<List<OrderModel>>.success(orders);

    } else {
      return OrdersResult.fail("Não foi possível recuperar os pedidos");
    }
  }
}
