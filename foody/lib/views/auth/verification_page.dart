import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/common/custom_container.dart';
import 'package:foody/controllers/verification_controller.dart';
import 'package:foody/views/auth/login_page.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerificationController());
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          title: ReusableText(
            text: "Please verify your Account",
            style: appStyle(12, kGray, FontWeight.w600),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: CustomContainer(
          color: Colors.white,
          containerContent: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height: height,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Lottie.asset("assets/anime/delivery.json"),
                  SizedBox(
                    height: 30.h,
                  ),
                  ReusableText(
                    text: "Verify your Account",
                    style: appStyle(20, kPrimary, FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  ReusableText(
                    text: "Enter the 6-digit code sent to your email",
                    style: appStyle(10, kGray, FontWeight.normal),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  OtpTextField(
                    numberOfFields: 6,
                    borderColor: kPrimary,
                    borderWidth: 2.0,
                    textStyle: appStyle(17, kDark, FontWeight.w600),
                    onCodeChanged: (String code) {},
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    onSubmit: (String verificationCode) {
                      controller.setCode = verificationCode;
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  CustomButton(
                      text: "V E R I F Y   A C C O U N T",
                      onTap: () {
                        controller.verificationFunction();
                      },
                      btnHeight: 35.h,
                      btnWidth: width),
                ],
              ),
            ),
          ),
        ));
  }
}
