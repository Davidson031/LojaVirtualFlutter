import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:quitanda_virtual/src/config/custom_colors.dart';
import 'package:badges/badges.dart';
import 'package:quitanda_virtual/src/config/app_data.dart' as appData;
import 'package:quitanda_virtual/src/pages/common_widgets/custom_shimmer.dart';
import 'package:quitanda_virtual/src/routes/app_pages.dart';
import '../../../models/item_model.dart';
import '../../../services/utils_services.dart';
import '../../common_widgets/app_name_widget.dart';
import 'components/cateogory_tile.dart';
import 'components/item_tile.dart';
import '../controller/home_controller.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  GlobalKey<CartIconKey> globalKeyCartItems = GlobalKey<CartIconKey>();

  late Function(GlobalKey) runAddToCardAnimation;

  UtilsServices utils = UtilsServices();

  void itemSelectedCertainAnimations(GlobalKey gkImage) {
    runAddToCardAnimation(gkImage);
  }

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: AppNameWidget(),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, right: 15.0),
            child: GestureDetector(
              onTap: () {},
              child: Badge(
                badgeColor: CustomColors.customContrastColor,
                badgeContent: const Text(
                  "0",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                child: AddToCartIcon(
                  key: globalKeyCartItems,
                  icon: Icon(
                    Icons.shopping_cart,
                    color: CustomColors.customSwatchColor[900],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: AddToCartAnimation(
        gkCart: globalKeyCartItems,
        previewDuration: const Duration(milliseconds: 30),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCartAnimationMethod) {
          runAddToCardAnimation = addToCartAnimationMethod;
        },
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: TextFormField(
                onChanged: (value) {
                  controller.searchTitle.value = value;
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: CustomColors.customContrastColor,
                    size: 21,
                  ),
                  hintText: "Pesquise aqui...",
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                  isDense: true,
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(60),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                ),
              ),
            ),
            GetBuilder<HomeController>(
              builder: (controller) {
                return Container(
                  padding: const EdgeInsets.only(left: 25),
                  height: 40,
                  child: !controller.isProductLoading
                      ? ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              category: controller.allCategories[index].title,
                              isSelected: controller.allCategories[index] ==
                                      controller.currentCategory
                                  ? true
                                  : false,
                              onPressed: () {
                                controller.selectCategory(
                                    controller.allCategories[index]);
                              },
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 10),
                          itemCount: controller.allCategories.length,
                        )
                      : ListView(
                          scrollDirection: Axis.horizontal,
                          children: List.generate(10, (index) {
                            return Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(right: 12),
                              child: CustomShimmer(
                                height: 20,
                                width: 70,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            );
                          }),
                        ),
                );
              },
            ),
            GetBuilder<HomeController>(
              builder: (controller) {
                return Expanded(
                  child: !controller.isCategoryLoading
                      ? GridView.builder(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            childAspectRatio: 9 / 11.5,
                          ),
                          itemCount: controller.allProducts.length,
                          itemBuilder: (context, index) {
                            if ((index + 1) == controller.allProducts.length) {
                              if (!controller.isLastPage) {
                                controller.loadMoreProducts();
                              }
                            }
                            return ItemTile(
                                item: controller.allProducts[index],
                                cartAnimationMethod:
                                    itemSelectedCertainAnimations);
                          },
                        )
                      : GridView.count(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          physics: const BouncingScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                          children: List.generate(
                            10,
                            (index) {
                              return CustomShimmer(
                                height: double.infinity,
                                width: double.infinity,
                                borderRadius: BorderRadius.circular(20),
                              );
                            },
                          ),
                        ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
