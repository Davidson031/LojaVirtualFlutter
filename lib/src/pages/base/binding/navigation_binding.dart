


import 'package:get/get.dart';
import 'package:quitanda_virtual/src/pages/base/controller/navigation.controller.dart';

class NavigationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => NavigationController());
  }


}