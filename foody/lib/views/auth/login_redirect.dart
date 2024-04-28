import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/common/custom_container.dart';
import 'package:foody/views/auth/login_page.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LoginRedirect extends StatelessWidget {
  const LoginRedirect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: Container(
            height: 100.h,
            child: Center(
              child: ReusableText(
                text: "Please login to access this page",
                style: appStyle(12, kLightWhite, FontWeight.bold),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
              containerContent: Container(
            child: Column(children: [
              SizedBox(
                height: 50.h,
              ),
              Lottie.asset("assets/anime/delivery.json"),
              SizedBox(
                height: 100.h,
              ),
              CustomButton(
                text: "Login",
                onTap: () {
                  Get.to(() => LoginPage());
                },
                btnHeight: 35.h,
                btnWidth: width / 1.1,
              ),
            ]),
          )),
        ));
  }
}
