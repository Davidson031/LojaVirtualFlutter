import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quitanda_virtual/src/pages/auth/screens/sign_in_screen.dart';
import 'package:quitanda_virtual/src/pages/auth/screens/sign_up_screen.dart';
import 'package:quitanda_virtual/src/pages/base/base_screen.dart';
import 'package:quitanda_virtual/src/pages/cart/binding/cart_binding.dart';
import 'package:quitanda_virtual/src/pages/home/binding/home_binding.dart';
import 'package:quitanda_virtual/src/pages/product/product_screen.dart';
import 'package:quitanda_virtual/src/pages/splash/splash_screen.dart';

import '../pages/base/binding/navigation_binding.dart';
import '../pages/teste_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.productRoute,
      page: () => ProductScreen(),
    ),
    GetPage(
      name: PagesRoutes.splashRoute,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: PagesRoutes.signInRoute,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: PagesRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: PagesRoutes.baseScreenRoute,
      page: () => BaseScreen(),
      bindings: [
        NavigationBinding(),
        HomeBinding(),
        CartBinding(),
      ],
    ),
  ];
}

abstract class PagesRoutes {
  static const String productRoute = "/product";
  static const String splashRoute = "/splash";
  static const String signInRoute = "/signin";
  static const String signUpRoute = "/signup";
  static const String testeRoute = "/teste";
  static const String baseScreenRoute = "/";
}
