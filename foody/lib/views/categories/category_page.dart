import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foody/common/back_ground_container.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/shimmers/foodlist_shimmer.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/controllers/category_controller.dart';
import 'package:foody/hooks/fetch_category_foods.dart';
import 'package:foody/models/foods.dart';
import 'package:foody/views/home/widgets/food_tile.dart';
import 'package:get/get.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetchFoodsByCategory("41007428");
    List<FoodsModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        leading: IconButton(
          onPressed: () {
            controller.updateCategory = '';
            controller.updateTitle = '';
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDark,
          ),
        ),
        title: ReusableText(
            text: "${controller.titleValue} Category",
            style: appStyle(13, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          //padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? const FoodsListShimmer()
              : Padding(
                  padding: EdgeInsets.all(12.h),
                  child: ListView(
                    children: List.generate(foods!.length, (i) {
                      FoodsModel food = foods[i];
                      return FoodTile(
                        food: food,
                      );
                    }),
                  ),
                ),
        ),
      ),
    );
  }
}
