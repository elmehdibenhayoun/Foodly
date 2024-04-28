import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/back_ground_container.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/shimmers/foodlist_shimmer.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/hooks/fetch_all_foods.dart';
import 'package:foody/models/foods.dart';
import 'package:foody/views/home/widgets/food_tile.dart';

class AllFastestFoods extends HookWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Fastest Foods",
          style: appStyle(13, kLightWhite, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: isLoading
              ? const FoodsListShimmer()
              : Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
                  children: List.generate(foods!.length, (i) {
                    var food = foods[i];
                    return FoodTile(
                      food: food,
                    );
                  }),
                ),
        ),
      ),
    );
  }
}
