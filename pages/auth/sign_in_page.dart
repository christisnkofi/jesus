import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:gospela1/base/custom_loader.dart';
import 'package:gospela1/pages/auth/sign_up_page.dart';
import 'package:gospela1/routes/route_helper.dart';
import 'package:gospela1/utils/colors.dart';
import 'package:gospela1/utils/dimensions.dart';
import 'package:gospela1/widgets/app_text_filed.dart';
import 'package:gospela1/widgets/big_text.dart';

import '../../base/show_custom_snackbar.dart';
import '../../controllers/auth_controller.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var phoneController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      String phone = phoneController.text.trim();
      String password = passwordController.text.trim();

      if (phone.isEmpty) {
        showCustomSnackBar('Type in your email address',
            title: 'Email address');
      } else if (!GetUtils.isEmail(phone)) {
        showCustomSnackBar('Type in a valid email address',
            title: 'Valid email address');
      } else if (password.isEmpty) {
        showCustomSnackBar('Type in your password', title: 'password');
      } else if (password.length < 6) {
        showCustomSnackBar('Password can not be less than six characters',
            title: 'password');
      } else {
        showCustomSnackBar('All went well', title: 'Perfect');

        authController.login(phone, password).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
            //Get.toNamed(RouteHelper.getCartPage());
          } else {
            showCustomSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (authController) {
          return !authController.isLoading
              ? SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      // app logo
                      Container(
                        height: Dimensions.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 80,
                            backgroundImage:
                                AssetImage('assets/image/logo part 1.png.jpg'),
                          ),
                        ),
                      ),
                      //welcome
                      Container(
                        margin: EdgeInsets.only(left: Dimensions.width20),
                        width: double.maxFinite,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                  fontSize: Dimensions.font20 * 3 +
                                      Dimensions.font20 / 2,
                                  //fontWeight: FontWeight.bold
                                  color: Colors.grey[500]),
                            ),
                            Text(
                              'Sign into your account',
                              style: TextStyle(
                                  fontSize: Dimensions.font20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //your email
                      AppTextField(
                          textEditingController: phoneController,
                          hintText: 'Phone',
                          icon: Icons.email),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //your password
                      AppTextField(
                        textEditingController: passwordController,
                        hintText: 'Password',
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      //tag line
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                              text: TextSpan(
                                  text: 'Sign into your account',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimensions.font20,
                                  ))),
                          SizedBox(
                            width: Dimensions.width20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign in
                      GestureDetector(
                        onTap: (() {
                          _login(authController);
                        }),
                        child: Container(
                          width: Dimensions.screenWidth / 2,
                          height: Dimensions.screenHeight / 13,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius30),
                              color: AppColors.mainColor),
                          child: Center(
                            child: BigText(
                              text: 'Sign in',
                              size: Dimensions.font20 + Dimensions.font20 / 2,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.screenHeight * 0.05,
                      ),
                      //sign up options
                      RichText(
                          text: TextSpan(
                              text: 'Don\'t an account?',
                              style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimensions.font20,
                              ),
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(() => SignUpPage(),
                                      transition: Transition.fade),
                                text: ' Create',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.mainBlackColor,
                                  fontSize: Dimensions.font20,
                                ))
                          ])),
                    ],
                  ),
                )
              : CustomLoader();
        }));
  }
}
