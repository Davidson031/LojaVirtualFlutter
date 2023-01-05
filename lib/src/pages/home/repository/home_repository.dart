import 'package:quitanda_virtual/src/models/category_model.dart';
import 'package:quitanda_virtual/src/pages/home/result/home_result.dart';
import 'package:quitanda_virtual/src/services/http_manager.dart';

import '../../../constants/endpoints.dart';

class HomeRepository {
  final _httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final res = await _httpManager.restRequest(
      url: EndPoints.getAllCategories,
      method: HttpMethods.post,
    );

    if(res['result'] != null){

      List<CategoryModel> data = (List<Map<String, dynamic>>.from(res['result'])).map((e) => CategoryModel.fromJson(e)).toList();

      return HomeResult<CategoryModel>.sucess(data);
      
    } else {
      return HomeResult.error("Ocorreu um erro ao recuperar as categorias");
    }

  }
}
