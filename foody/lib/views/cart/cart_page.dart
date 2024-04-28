import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/controllers/login_controller.dart';
import 'package:foody/models/login_response.dart';
import 'package:foody/views/auth/login_redirect.dart';
import 'package:foody/views/auth/verification_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/custom_container.dart';
import '../../constants/constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    LoginResponse? user;
    final box = GetStorage();

    String? token = box.read('token');
    if (token != null) {
      user = controller.getUserInfo();
      print(user!.email);
    }

    if (token == null) {
      return const LoginRedirect();
    }
    if (user != null && user.verification == false) {
      return const VerificationPage();
    }
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: Container(height: 130.h),
        ),
        body: SafeArea(
          child: CustomContainer(containerContent: Container()),
        ));
  }
}
