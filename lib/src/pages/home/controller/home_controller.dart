import 'package:get/get.dart';
import 'package:quitanda_virtual/src/models/category_model.dart';
import 'package:quitanda_virtual/src/pages/home/repository/home_repository.dart';
import 'package:quitanda_virtual/src/pages/home/result/home_result.dart';
import 'package:quitanda_virtual/src/services/utils_services.dart';

import '../../../models/item_model.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();

  RxString searchTitle = ''.obs;
  bool isCategoryLoading = false;
  bool isProductLoading = true;
  final UtilsServices utils = UtilsServices();
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;
  List<ItemModel> get allProducts {
    return currentCategory?.items ?? [];
  }

  bool get isLastPage {
    if (currentCategory!.items.length < 6) return true;
    return currentCategory!.pagination * 6 > allProducts.length;
  }

  @override
  void onInit() {
    super.onInit();

    debounce(searchTitle, (_) {
      filterByTitle();
    }, time: const Duration(milliseconds: 600));

    getAllCategories();
  }

  void loadMoreProducts() {
    currentCategory!.pagination++;
    getAllProducts(canLoad: false);
  }

  Future<void> getAllProducts({bool canLoad = true}) async {
    if (canLoad) {
      setLoading(true, isProduct: true);
    }

    Map<String, dynamic> body = {
      "page": currentCategory!.pagination,
      "categoryId": currentCategory!.id,
      "itemsPerPage": 6
    };

    if(searchTitle.value.isNotEmpty){

      body['title'] = searchTitle.value;

      if(currentCategory!.id == ''){
        body.remove('categoryId');
      }

    }



    HomeResult<ItemModel> res = await homeRepository.getAllProducts(body);

    setLoading(false, isProduct: true);

    res.when(
      sucess: (data) {
        currentCategory!.items.addAll(data);
      },
      error: (msg) {
        utils.showToast(message: msg, isError: true);
      },
      teste: (msg) {},
    );
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

  void setLoading(bool value, {bool isProduct = false}) {
    if (!isProduct) {
      isCategoryLoading = value;
    } else {
      isProductLoading = value;
    }
    update();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    if (currentCategory!.items.isNotEmpty) return;

    getAllProducts();
  }

  void filterByTitle() {
    for (var category in allCategories) {
      category.items.clear();
      category.pagination = 0;
    }

    if (searchTitle.value.isEmpty) {
      allCategories.removeAt(0);
    } else {
      CategoryModel? c =
          allCategories.firstWhereOrNull((category) => category.id == '');

      if (c == null) {
        final allProductsCategory = CategoryModel(
          title: "Todos",
          id: "",
          items: [],
          pagination: 0,
        );

        allCategories.insert(0, allProductsCategory);
      } else {
        c.items.clear();

        c.pagination = 0;
      }
    }

    currentCategory = allCategories.first;
    update();
    getAllProducts();
  }
}
