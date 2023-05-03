import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gospela1/controllers/cart_controller.dart';
import 'package:gospela1/controllers/popular_product_controller.dart';
import 'package:gospela1/pages/auth/sign_up_page.dart';
import 'package:gospela1/pages/computer/popular_computer_detail.dart';
import 'package:gospela1/pages/home/food_page_body.dart';
import 'package:gospela1/pages/home/main_screen_page.dart';
import 'package:gospela1/pages/splash/splash_page.dart';
import 'package:gospela1/routes/route_helper.dart';
import 'controllers/recommended_product_controller.dart';
import 'pages/auth/sign_in_page.dart';
import 'pages/cart/cart_page.dart';
import 'pages/computer/recommended_computer_detail.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.int();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<CartController>().getCartData();
    return GetBuilder<PopularProductController>(builder: (_) {
      return GetBuilder<RecommendedProductController>(builder: (_) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Gospel AI',
          //home: SignInPage(),
          //home: SplashScreen(),
          //home: MainScreenPage(),
          initialRoute: RouteHelper.getSplashPage(),
          getPages: RouteHelper.routes,
        );
      });
    });
  }
}
