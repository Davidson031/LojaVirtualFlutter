import '../../../constants/endpoints.dart';
import '../../../services/http_manager.dart';

class AuthRepository {
  
  Future signIn({required String email, required String password}) async {
    HttpManager _httpManager = HttpManager();

    final res = await _httpManager.restRequest(
      url: EndPoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (res['result'] != null) {
      print("Deu bom no Sign In");
    } else {
      print("Deu ruim no Sign In");
    }
  }
}
