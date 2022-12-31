import 'package:dio/dio.dart';

abstract class HttpMethods {
  static const String post = "POST";
  static const String get = "GET";
  static const String delete = "DELETE";
  static const String put = "PUT";
  static const String patch = "PATCH";
}

class HttpManager {
  Future<Map> restRequest({required String url,required String method,Map? headers,Map? body}) async {
    
    
    //montando o header que irá sempre nas requisiões, caso não seja passado um header customizado ele inicia um vazio e adiciona os padrão
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': 'g1Oui3JqxnY4S1ykpQWHwEKGOe0dRYCPvPF4iykc',
        'X-Parse-REST-API-Key': 'rFBKU8tk0m5ZlKES2CGieOaoYz6TgKxVMv8jRIsN',
      });

    Dio dio = Dio();

    //tenta fazer a requisição e retorna o map com o resultado.
    try {
      Response res = await dio.request(
        url,
        data: body,
        options: Options(
          method: method,
          headers: defaultHeaders,
        ),
      );

      return res.data;
    } on DioError catch (e) {
      //retornando o map de erro que o Dio nos retorna em caso de erro no endpoint
      return e.response?.data ?? {};
    } catch (e) {
      //retornando map vazio em caso de erro 
      return {};
    }
  }
}


