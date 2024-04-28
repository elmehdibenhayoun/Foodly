import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/shimmers/nearby_shimmer.dart';
import 'package:foody/hooks/fetch_foods.dart';
import 'package:foody/models/foods.dart';
import 'package:foody/views/food/food_page.dart';
import 'package:foody/views/home/widgets/food_widget.dart';
import 'package:get/get.dart';

class FoodList extends HookWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Container(
      height: 210.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: isLoading
          ? const NearbyShimmer()
          : ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(foods!.length, (i) {
                FoodsModel food = foods[i];
                return FoodWidget(
                    onTap: () {
                      Get.to(() => FoodPage(food: food));
                    },
                    image: food.imageUrl[0],
                    title: food.title,
                    time: food.time,
                    price: food.price.toStringAsFixed(2));
              }),
            ),
    );
  }
}
