import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:foody/common/shimmers/foodlist_shimmer.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/hooks/fetch_foods.dart';
import 'package:foody/hooks/fetch_foods_by_restaurant.dart';
import 'package:foody/models/foods.dart';
import 'package:foody/views/home/widgets/food_tile.dart';

class ExploreWidget extends HookWidget {
  final String code;
  const ExploreWidget({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods(code);
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      backgroundColor: kLightWhite,
      body: isLoading
          ? const FoodsListShimmer()
          : SizedBox(
              height: height * 0.7,
              child: ListView(
                  padding: EdgeInsets.zero,
                  children: List.generate(foods!.length, (index) {
                    final FoodsModel food = foods[index];
                    return FoodTile(food: food);
                  })),
            ),
    );
  }
}
