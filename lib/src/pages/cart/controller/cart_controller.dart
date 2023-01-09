import 'package:get/get.dart';
import 'package:quitanda_virtual/src/models/cart_item_model.dart';
import 'package:quitanda_virtual/src/models/item_model.dart';
import 'package:quitanda_virtual/src/pages/auth/controller/auth_controller.dart';
import 'package:quitanda_virtual/src/pages/cart/cart_result/cart_result.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';
import '../repository/cart_repository.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  final UtilsServices utils = UtilsServices();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> res =
        await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );

    res.when(
      success: (data) {
        cartItems = data;
        update();
      },
      error: (message) {
        utils.showToast(message: message, isError: true);
      },
    );
  }

  double cartTotalPrice() {
    double total = 0.0;

    for (final item in cartItems) {
      total = total + item.totalPrice();
    }

    return total;
  }

  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((element) => item.id == element.item.id);
  }

  Future<void> addItemToCart(
      {required ItemModel item, int quantity = 1}) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      //item já existe no carrinho


      //recuperando produto
      final product = cartItems[itemIndex];

      final result = await changeItemQuantity(item: product, quantity: (product.quantity + quantity));

      if(result){
        cartItems[itemIndex].quantity += quantity;
      } else {
        utils.showToast(message: "Erro", isError: true);
      }


    } else {
      //novo item
      final CartResult<String> res = await cartRepository.addItemToCart(
        userId: authController.user.id!,
        token: authController.user.token!,
        productId: item.id,
        quantity: quantity,
      );

      res.when(
        success: (cartItemId) {
          cartItems.add(
              CartItemModel(id: cartItemId, item: item, quantity: quantity));
        },
        error: (message) {
          utils.showToast(message: message, isError: true);
        },
      );
    }

    update();
  }

  Future<bool> changeItemQuantity(
      {required CartItemModel item, required int quantity}) async {
    final res = await cartRepository.changeItemQuantity(
      token: authController.user.token!,
      cartItemId: item.id,
      quantity: quantity,
    );

    return res;
  }
}
