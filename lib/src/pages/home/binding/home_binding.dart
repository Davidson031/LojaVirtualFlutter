import 'package:get/get.dart';
import '../../base/controller/navigation.controller.dart';
import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(NavigationController());
  }
}
