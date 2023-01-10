import 'package:quitanda_virtual/src/constants/endpoints.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/models/order_model.dart';
import 'package:quitanda_virtual/src/pages/cart/cart_result/cart_result.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

class CartRepository {
  final _httpManager = HttpManager();

  Future<CartResult<List<CartItemModel>>> getCartItems(
      {required String token, required String userId}) async {
    final res = await _httpManager.restRequest(
      url: EndPoints.getCartItems,
      method: HttpMethods.post,
      headers: {"X-Parse-Session-Token": token},
      body: {"user": userId},
    );

    if (res['result'] != null) {
      List<CartItemModel> data = List<Map<String, dynamic>>.from(res['result'])
          .map(CartItemModel.fromJson)
          .toList();
      return CartResult<List<CartItemModel>>.success(data);
    } else {
      return CartResult.error("ocorreu um erro ao recuperar os itens");
    }
  }

  Future<CartResult<String>> addItemToCart(
      {required String userId,
      required String token,
      required String productId,
      required int quantity}) async {
    final res = await _httpManager.restRequest(
        url: EndPoints.addItemToCart,
        method: HttpMethods.post,
        body: {
          "user": userId,
          "quantity": quantity,
          "productId": productId,
        },
        headers: {
          "X-Parse-Session-Token": token,
        });

    if (res['result'] != null) {
      return CartResult<String>.success(res['result']['id']);
    } else {
      return CartResult<String>.error(
          "Não foi possível adicionar o item no carrinho");
    }
  }

  Future<bool> changeItemQuantity(
      {required String token,
      required cartItemId,
      required int quantity}) async {
    final res = await _httpManager.restRequest(
      url: EndPoints.modifyItemQuantity,
      method: HttpMethods.post,
      body: {
        "cartItemId": cartItemId,
        "quantity": quantity,
      },
      headers: {"X-Parse-Session-Token": token},
    );
    return (res.isEmpty);
  }

  Future<CartResult<OrderModel>> checkoutCart({required String token, required double total}) async {
    final res = await _httpManager.restRequest(
      url: EndPoints.checkout,
      method: HttpMethods.post,
      headers: {
        "X-Parse-Session-Token" : token
      },
      body: {
        "total" : total
      }
    );


    if(res['result'] != null){

      final order = OrderModel.fromJson(res['result']);
      
      return CartResult.success(order);
    } else {
      return CartResult.error("Não foi possível realizar o pedido");
    }
  }
}
