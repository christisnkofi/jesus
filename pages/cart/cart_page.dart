import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gospela1/base/no_data_page.dart';
import 'package:gospela1/controllers/auth_controller.dart';
import 'package:gospela1/controllers/cart_controller.dart';
import 'package:gospela1/controllers/location_controller.dart';
import 'package:gospela1/controllers/popular_product_controller.dart';
import 'package:gospela1/pages/home/main_screen_page.dart';
import 'package:gospela1/utils/app_constants.dart';
import 'package:gospela1/utils/colors.dart';
import 'package:gospela1/utils/dimensions.dart';
import 'package:gospela1/widgets/app_icon.dart';
import 'package:gospela1/widgets/big_text.dart';
import 'package:gospela1/widgets/small_text.dart';
import '../../controllers/recommended_product_controller.dart';
import '../../routes/route_helper.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimensions.height20 * 3,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  BackgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    BackgroundColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  BackgroundColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getItems.length > 0
                ? Positioned(
                    top: Dimensions.height20 * 5,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    bottom: 0,
                    child: Container(
                      margin: EdgeInsets.only(top: Dimensions.height15),
                      //color: Colors.red,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: GetBuilder<CartController>(
                            builder: (CartController) {
                          var _cartList = CartController.getItems;
                          return ListView.builder(
                              itemCount: _cartList.length,
                              itemBuilder: (_, index) {
                                return Container(
                                  width: double.maxFinite,
                                  height: Dimensions.height20 * 5,
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          var popularIndex = Get.find<
                                                  PopularProductController>()
                                              .popularProductList
                                              .indexOf(
                                                  _cartList[index].product!);
                                          if (popularIndex >= 0) {
                                            Get.toNamed(
                                                RouteHelper.getPopularComputer(
                                                    popularIndex, 'cartpage'));
                                          } else {
                                            var recommendedIndex = Get.find<
                                                    RecommendedProductController>()
                                                .recommendedProductList
                                                .indexOf(
                                                    _cartList[index].product!);
                                            if (recommendedIndex < 0) {
                                              Get.snackbar(
                                                "History product",
                                                "Product review is not available for history products",
                                                backgroundColor:
                                                    AppColors.mainColor,
                                                colorText: Colors.white,
                                              );
                                            } else {
                                              Get.toNamed(RouteHelper
                                                  .getRecommendedComputer(
                                                      recommendedIndex,
                                                      'cartpage'));
                                            }
                                          }
                                        },
                                        child: Container(
                                          width: Dimensions.height20 * 5,
                                          height: Dimensions.height20 * 5,
                                          margin: EdgeInsets.only(
                                              bottom: Dimensions.height10),
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    AppConstants.BASE_URL +
                                                        AppConstants
                                                            .UPLOAD_URL +
                                                        CartController
                                                            .getItems[index]
                                                            .img!,
                                                  )),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius20),
                                              color: Colors.white),
                                        ),
                                      ),
                                      SizedBox(
                                        width: Dimensions.width10,
                                      ),
                                      Expanded(
                                          child: Container(
                                        height: Dimensions.height20 * 5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            BigText(
                                                text: CartController
                                                    .getItems[index].name!,
                                                color: Colors.black54),
                                            SmallText(
                                                text: 'Dell Inspiron core I5'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                    text: CartController
                                                        .getItems[index].price
                                                        .toString(),
                                                    color: Colors.redAccent),
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      top: Dimensions.height10,
                                                      bottom:
                                                          Dimensions.height10,
                                                      left: Dimensions.width10,
                                                      right:
                                                          Dimensions.width10),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              Dimensions
                                                                  .radius20),
                                                      color: Colors.white),
                                                  child:
                                                      CartController.getItems
                                                                  .length >
                                                              0
                                                          ? Row(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    CartController.addItem(
                                                                        _cartList[index]
                                                                            .product!,
                                                                        -1);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .remove,
                                                                    color: AppColors
                                                                        .signColor,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: Dimensions
                                                                          .width10 /
                                                                      2,
                                                                ),
                                                                BigText(
                                                                    text: _cartList[
                                                                            index]
                                                                        .quantity
                                                                        .toString()), // popularProduct.inCartItems.toString()),
                                                                SizedBox(
                                                                  width: Dimensions
                                                                          .width10 /
                                                                      2,
                                                                ),
                                                                GestureDetector(
                                                                  onTap: () {
                                                                    CartController.addItem(
                                                                        _cartList[index]
                                                                            .product!,
                                                                        1);
                                                                    print(
                                                                        'being tapped');
                                                                  },
                                                                  child: Icon(
                                                                    Icons.add,
                                                                    color: AppColors
                                                                        .signColor,
                                                                  ),
                                                                )
                                                              ],
                                                            )
                                                          : Container(),
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ))
                                    ],
                                  ),
                                );
                              });
                        }),
                      ),
                    ),
                  )
                : NoDataPage(text: 'Your cart is empty!');
          })
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (CartController) {
          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                      BigText(
                          text: '\$ ' + CartController.totalAmount.toString()),
                      SizedBox(
                        width: Dimensions.width10 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (Get.find<AuthController>().userLoggedIn()) {
                      print("logged in?");
                      if (Get.find<LocationController>().addressList.isEmpty) {
                        Get.toNamed(RouteHelper.getAddressPage());
                      } else {
                        Get.offNamed(RouteHelper.getInitial());
                      }
                    } else {
                      Get.toNamed(RouteHelper.getSignInPage());
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width15),
                    child: BigText(
                      text: 'Check out',
                      color: Colors.white,
                    ),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
