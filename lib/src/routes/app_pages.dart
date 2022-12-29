import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quitanda_virtual/src/pages/auth/screens/sign_in_screen.dart';
import 'package:quitanda_virtual/src/pages/auth/screens/sign_up_screen.dart';
import 'package:quitanda_virtual/src/pages/base/base_screen.dart';
import 'package:quitanda_virtual/src/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
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
    ),
  ];
}

abstract class PagesRoutes {

  static const String splashRoute = "/splash";
  static const String signInRoute = "/signin";
  static const String signUpRoute = "/signup";
  static const String baseScreenRoute = "/";

}
