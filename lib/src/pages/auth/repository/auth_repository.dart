import 'package:flutter/cupertino.dart';
import 'package:quitanda_virtual/src/models/user_model.dart';
import 'package:quitanda_virtual/src/pages/auth/repository/auth_errors.dart'
    as authErrors;

import '../../../constants/endpoints.dart';
import '../../../services/http_manager.dart';
import '../result/auth_result.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> res) {
    if (res['result'] != null) {
      final user = UserModel.fromJson(res['result']);
      return AuthResult.sucess(user);
    } else {
      return AuthResult.fail((res['error']));
    }
  }

  Future<AuthResult> signIn(
      {required String email, required String password}) async {
    final res = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    return handleUserOrError(res);
  }

  Future<AuthResult> validateToken(String token) async {
    final res = await _httpManager.restRequest(
        url: EndPoints.validateToken,
        method: HttpMethods.post,
        headers: {"X-Parse-Session-Token": token});

    return handleUserOrError(res);
  }

  Future<AuthResult> signUp(UserModel model) async {
    final res = await _httpManager.restRequest(
      url: EndPoints.signup,
      method: HttpMethods.post,
      body: model.toJson(),
    );

    return handleUserOrError(res);
  }
}
