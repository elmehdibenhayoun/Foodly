import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/controllers/login_controller.dart';
import 'package:foody/models/login_response.dart';
import 'package:foody/views/auth/login_page.dart';
import 'package:foody/views/auth/login_redirect.dart';
import 'package:foody/views/auth/verification_page.dart';
import 'package:foody/views/profile/shipping_address_page.dart';
import 'package:foody/views/profile/widget/profile_app_bar.dart';

import 'package:foody/views/profile/widget/profile_tile_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../common/custom_container.dart';
import '../../constants/constants.dart';
import 'widget/user_info_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginResponse? user;
    final controller = Get.put(LoginController());

    final box = GetStorage();

    String? token = box.read('token');

    if (token != null) {
      user = controller.getUserInfo();
    }

    if (token == null) {
      return const LoginRedirect();
    }
    if (user != null && user.verification == false) {
      print(user.verification);
      return const VerificationPage();
    }
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.h),
          child: const ProfileAppBar(),
        ),
        body: SafeArea(
          child: CustomContainer(
              containerContent: Column(
            children: [
              UserInfoWidget(user: user),
              SizedBox(height: 10.h),
              Container(
                height: 190.h,
                decoration: const BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTile(
                        onTap: () {
                          Get.to(() => LoginPage());
                        },
                        title: "My Orders",
                        icon: Ionicons.fast_food_outline),
                    ProfileTile(
                        onTap: () {},
                        title: "My Favorite Places",
                        icon: Ionicons.heart_outline),
                    ProfileTile(
                        onTap: () {},
                        title: "Review",
                        icon: Ionicons.chatbubble_outline),
                    ProfileTile(
                        onTap: () {},
                        title: "Coupon",
                        icon: MaterialCommunityIcons.tag_outline),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                height: 190.h,
                decoration: const BoxDecoration(color: kLightWhite),
                child: ListView(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ProfileTile(
                        onTap: () {
                          Get.to(() => ShippingAddress(),
                              transition: Transition.rightToLeft,
                              duration: const Duration(microseconds: 900));
                        },
                        title: "Shipping Address",
                        icon: SimpleLineIcons.location_pin),
                    ProfileTile(
                        onTap: () {},
                        title: "Service Center",
                        icon: AntDesign.customerservice),
                    ProfileTile(
                        onTap: () {},
                        title: "App FeedBack",
                        icon: MaterialIcons.rss_feed),
                    ProfileTile(
                        onTap: () {},
                        title: "Settings",
                        icon: AntDesign.setting),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              CustomButton(
                onTap: () {
                  controller.logout();
                },
                btncolor: kRed,
                text: "Logout",
                radius: 0,
              )
            ],
          )),
        ));
  }
}
