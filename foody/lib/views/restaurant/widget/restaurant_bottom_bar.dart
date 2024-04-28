import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/custom_button.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/restaurants.dart';
import 'package:foody/views/restaurant/rating_page.dart';
import 'package:foody/views/restaurant/restaurant_page.dart';
import 'package:get/get.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
    required this.restaurant,
  });

  final RestaurantsModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
              itemCount: 5,
              itemSize: 25,
              rating: restaurant!.rating.toDouble(),
              itemBuilder: (context, i) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )),
          CustomButton(
            onTap: () {
              Get.to(() => const RatingPage());
            },
            btnWidth: width / 3,
            text: "Rate Restaurant",
            btncolor: kSecondary,
          )
        ],
      ),
    );
  }
}
