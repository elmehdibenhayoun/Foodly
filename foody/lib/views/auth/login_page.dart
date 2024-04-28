import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/back_ground_container.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/controllers/login_controller.dart';
import 'package:foody/models/login.dart';
import 'package:foody/views/auth/widget/email_textfield.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/views/auth/registration_page.dart';
import 'package:foody/views/auth/widget/password_textfield.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  final FocusNode _passwordFocusNode = FocusNode();
  @override
  void dispose() {
    _passwordFocusNode.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: Center(
          child: ReusableText(
            text: "Foodly Family",
            style: appStyle(20, kLightWhite, FontWeight.bold),
          ),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
          child: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Lottie.asset("assets/anime/delivery.json"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    EmailTextField(
                      hintText: "Email",
                      prefixIcon: const Icon(CupertinoIcons.mail,
                          size: 22, color: kGrayLight),
                      controller: _emailController,
                    ),
                    SizedBox(height: 25.h),
                    PasswordTextField(
                      controller: _passwordController,
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const RegistrationPage(),
                                  transition: Transition.fadeIn,
                                  duration: const Duration(microseconds: 1200));
                            },
                            child: ReusableText(
                                text: "Register",
                                style: appStyle(
                                    12, Colors.blue, FontWeight.normal)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    CustomButton(
                      text: "Login",
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          LoginModel model = LoginModel(
                              email: _emailController.text,
                              password: _passwordController.text);
                          String data = loginToJson(model);
                          //Login Function
                          controller.loginFunction(data);
                        }
                      },
                      btnHeight: 35.h,
                      btnWidth: width,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
