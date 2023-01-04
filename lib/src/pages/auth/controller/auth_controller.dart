import 'package:get/get.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';
import 'package:quitanda_virtual/src/pages/auth/repository/auth_repository.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../../../constants/storage_keys.dart';
import '../../../routes/app_pages.dart';
import '../result/auth_result.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  final UtilsServices utils = UtilsServices();
  AuthRepository authRepository = AuthRepository();
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToken();
  }

  void saveTokenAndProceedToBase() {
    utils.saveLocalData(key: StorageKeys.token, data: user.token!);
    Get.offAllNamed(PagesRoutes.baseScreenRoute);
  }

  Future<void> signIn({required String email, required String password}) async {
    isLoading.value = true;

    AuthResult result = await authRepository.signIn(
      email: email,
      password: password,
    );

    result.when(
      sucess: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      fail: (message) {
        utils.showToast(message: message, isError: true);
      },
    );

    isLoading.value = false;
  }

  Future<void> validateToken() async {
    String? token = await utils.getLocalData(StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }

    AuthResult res = await authRepository.validateToken(token);

    res.when(
      sucess: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      fail: (message) {
        signOut();
      },
    );
  }

  Future<void> signOut() async {
    user = UserModel();
    await utils.removeLocalData(StorageKeys.token);
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  Future<void> signUp() async {

    isLoading.value = true;

    AuthResult res = await authRepository.signUp(user);

    isLoading.value = false;

    res.when(
      sucess: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      fail: (message) {
        utils.showToast(message: message, isError: true);
      },
    );
  }
}
