import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({
    super.key,
    this.user,
  });

  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.06,
      width: width,
      color: kLightWhite,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(12.w, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 35.h,
                      width: 35.w,
                      child: CircleAvatar(
                        backgroundColor: kGrayLight,
                        backgroundImage: NetworkImage(user!.profile),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Padding(
                      padding: EdgeInsets.all(4.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                              text: user!.username ?? "UserName",
                              style: appStyle(12, kGray, FontWeight.w600)),
                          ReusableText(
                              text: user!.email ?? "Email@gmail.com",
                              style: appStyle(10, kGray, FontWeight.normal)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
