import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/custom_container.dart';
import 'package:foody/common/heading.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/category_controller.dart';
import 'package:foody/views/home/all_fastest_foods.dart';
import 'package:foody/views/home/all_nearby_restaurants.dart';
import 'package:foody/views/home/recommendations_page.dart';
import 'package:foody/views/home/widgets/category_foods_list.dart';
import 'package:foody/views/home/widgets/category_list.dart';
import 'package:foody/views/home/widgets/food_list.dart';
import 'package:foody/views/home/widgets/nearby_restaurants_list.dart';
import 'package:get/get.dart';

import '../../common/custom_appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
        backgroundColor: kPrimary,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h),
          child: const CustomAppBar(),
        ),
        body: SafeArea(
          child: CustomContainer(
              containerContent: Column(
            children: [
              const CategoryList(),
              Obx(
                () => controller.categoryValue == ''
                    ? Column(
                        children: [
                          Heading(
                            text: "Try Something New",
                            onTap: () {
                              Get.to(
                                () => const Recommendations(),
                                transition: Transition.cupertino,
                                duration: const Duration(microseconds: 12000),
                              );
                            },
                          ),
                          const FoodList(),
                          Heading(
                            text: "Nearby Reastaurants",
                            onTap: () {
                              Get.to(
                                () => const AllNearbyRestaurants(),
                                transition: Transition.leftToRight,
                                duration: const Duration(seconds: 1),
                              );
                            },
                          ),
                          NearbyRestaurants(),
                          Heading(
                            text: "Food closer to you",
                            onTap: () {
                              Get.to(
                                () => const AllFastestFoods(),
                                transition: Transition.cupertino,
                                duration: const Duration(microseconds: 1200),
                              );
                            },
                          ),
                          const FoodList(),
                        ],
                      )
                    : CustomContainer(
                        containerContent: Column(
                        children: [
                          Heading(
                            more: true,
                            text: "Explore ${controller.titleValue} Category",
                            onTap: () {
                              Get.to(
                                () => const Recommendations(),
                                transition: Transition.cupertino,
                                duration: const Duration(microseconds: 12000),
                              );
                            },
                          ),
                          CategoryFoodsList(),
                        ],
                      )),
              ),
            ],
          )),
        ));
  }
}
