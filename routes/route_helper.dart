import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:gospela1/pages/address/add_address_page.dart';
import 'package:gospela1/pages/auth/sign_in_page.dart';
import 'package:gospela1/pages/cart/cart_page.dart';
import 'package:gospela1/pages/computer/popular_computer_detail.dart';
import 'package:gospela1/pages/home/home_page.dart';
import 'package:gospela1/pages/home/main_screen_page.dart';
import 'package:gospela1/pages/splash/splash_page.dart';
import '../pages/computer/recommended_computer_detail.dart';

class RouteHelper {
  static const String splashPage = '/splash-page';
  static const String initial = '/';
  static const String popularComputer = '/popular-computer';
  static const String recommendedComputer = '/recommended-computer';
  static const String cartPage = '/cart-page';
  static const String signIn = '/sign-in';
  static const String addAddress = "/add-address";

  static String getSplashPage() => '$splashPage';
  static String getInitial() => '$initial';
  static String getPopularComputer(int pageId, String page) =>
      '$popularComputer?pageId=$pageId&page=$page';
  static String getRecommendedComputer(int pageId, String page) =>
      '$recommendedComputer?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';
  static String getSignInPage() => '$signIn';
  static String getAddressPage() => '$addAddress';

  static List<GetPage> routes = [
    GetPage(name: splashPage, page: () => SplashScreen()),
    GetPage(
        name: initial,
        page: () {
          return HomePage();
        },
        transition: Transition.fade),
    GetPage(
        name: signIn,
        page: () {
          return SignInPage();
        },
        transition: Transition.fade),
    GetPage(
        name: popularComputer,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return PopularComputerDetail(pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedComputer,
        page: () {
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedComputerDetail(
              pageId: int.parse(pageId!), page: page!);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: (() {
          return CartPage();
        }),
        transition: Transition.fadeIn),
    GetPage(
        name: addAddress,
        page: (() {
          return AddAddressPage();
        }))
  ];
}
