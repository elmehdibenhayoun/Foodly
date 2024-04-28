import 'package:flutter/material.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/phone_verification_controller.dart';
import 'package:foody/services/verification_service.dart';
import 'package:get/get.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatefulWidget {
  const PhoneVerificationPage({super.key});

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  VerificationService _verificationService = VerificationService();

  String _verificationId = '';
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return Obx(
      () => controller.isLoading == false
          ? PhoneVerification(
              isFirstPage: false,
              enableLogo: false,
              themeColor: kPrimary,
              backgroundColor: kLightWhite,
              initialPageText: "Verify Phone Number",
              initialPageTextStyle: appStyle(20, kPrimary, FontWeight.bold),
              textColor: kDark,
              onSend: (String value) {
                controller.setPhone = value;
                _verificationPhoneNumber(value);
              },
              onVerification: (String value) {
                _submitVerificationcode(value);
              },
            )
          : Container(
              color: kLightWhite,
              width: width,
              height: height,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
    );
  }

  void _verificationPhoneNumber(String phoneNumber) async {
    final controller = Get.put(PhoneVerificationController());
    await _verificationService.verifyPhoneNumber(controller.phone,
        codeSent: (String verificationId, int? resendToken) {
      setState(() {
        _verificationId = verificationId;
      });
    });
  }

  void _submitVerificationcode(String code) async {
    await _verificationService.verifySmsCode(_verificationId, code);
  }
}
