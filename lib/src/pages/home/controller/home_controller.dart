import 'package:get/get.dart';
import 'package:quitanda_virtual/src/models/category_model.dart';
import 'package:quitanda_virtual/src/pages/home/repository/home_repository.dart';
import 'package:quitanda_virtual/src/pages/home/result/home_result.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();

  bool isLoading = false;

  final UtilsServices utils = UtilsServices();

  List<CategoryModel> allCategories = [];

  CategoryModel? currentCategory;

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  Future<void> getAllCategories() async {
    setLoading(true);

    final HomeResult<CategoryModel> res =
        await homeRepository.getAllCategories();

    setLoading(false);

    res.when(
      sucess: (listaDeCategorias) {
        allCategories.assignAll(listaDeCategorias);

        if (allCategories.isEmpty) return;

        selectCategory(allCategories.first);
      },
      error: (msg) {
        utils.showToast(message: msg, isError: true);
      },
      teste: (msg) {},
    );
  }

  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;

    update();
  }
}
