import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/back_ground_container.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/controllers/registration_controller.dart';
import 'package:foody/models/registration.dart';
import 'package:foody/views/auth/verification_page.dart';
import 'package:foody/views/auth/widget/email_textfield.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _userController = TextEditingController();
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
    final controller = Get.put(RegistrationController());
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
                      hintText: "UserName",
                      prefixIcon: const Icon(CupertinoIcons.profile_circled,
                          size: 22, color: kGrayLight),
                      controller: _userController,
                    ),
                    SizedBox(height: 25.h),
                    EmailTextField(
                      hintText: "Email",
                      prefixIcon: const Icon(CupertinoIcons.mail,
                          size: 22, color: kGrayLight),
                      controller: _emailController,
                    ),
                    SizedBox(height: 25.h),
                    EmailTextField(
                      hintText: "Password",
                      prefixIcon: const Icon(CupertinoIcons.mail,
                          size: 22, color: kGrayLight),
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
                              //Get.to(() => VerificationPage());
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
                      text: "Register",
                      onTap: () {
                        if (_emailController.text.isNotEmpty &&
                            _userController.text.isNotEmpty &&
                            _passwordController.text.length >= 8) {
                          RegistrationModel model = RegistrationModel(
                              username: _userController.text,
                              email: _emailController.text,
                              password: _passwordController.text);
                          String data = registrationModelToJson(model);
                          //Login Function
                          controller.registrationFunction(data);
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
