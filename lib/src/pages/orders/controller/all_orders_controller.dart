import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/orders/repository/orders_repository.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';
import '../../../models/order_model.dart';
import '../../auth/controller/auth_controller.dart';
import '../orders_result/orders_result.dart';

class AllOrdersController extends GetxController {
  List<OrderModel> allOrders = [];
  final ordersRepository = OrdersRepository();
  final authController = Get.find<AuthController>();
  final UtilsServices utils = UtilsServices();


  @override
  void onInit(){
    super.onInit();
     getAllProducts();  
  }


  Future<void> getAllProducts() async {
    OrdersResult<List<OrderModel>> res = await ordersRepository.getAllOrders(
      userId: authController.user.id!,
      token: authController.user.token!,
    );

    res.when(
      success: (data) {
        allOrders = data;
        update();
      },
      fail: (message) {
        utils.showToast(message: message, isError: true);
      },
    );
  }
}
