import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/constants/uidata.dart';
import 'package:foody/models/restaurants.dart';
import 'package:foody/views/restaurant/directions_page.dart';
import 'package:foody/views/restaurant/widget/explore_widget.dart';
import 'package:foody/views/restaurant/widget/restaurant_menu.dart';
import 'package:get/get.dart';

import 'widget/restaurant_bottom_bar.dart';
import 'widget/restaurant_top_bar.dart';
import 'widget/row_text.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({super.key, required this.restaurant});

  final RestaurantsModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover, imageUrl: widget.restaurant!.imageUrl),
                ),
                Positioned(
                  bottom: 0,
                  child: RestaurantBottomBar(restaurant: widget.restaurant!),
                ),
                Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: RestaurantTopBar(restaurant: widget.restaurant!))
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  const RowText(
                      first: "Distance to Restaurant", second: "2.7 km"),
                  SizedBox(height: 3.h),
                  const RowText(first: "Estimated Price", second: "\$ 2.7"),
                  SizedBox(height: 3.h),
                  const RowText(first: "Estimated Time", second: "30 min"),
                  const Divider(thickness: 0.7),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Container(
                height: 25.h,
                width: width,
                decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(25.r)),
                child: TabBar(
                  controller: _tabController,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(25.r)),
                  labelPadding: EdgeInsets.zero,
                  labelColor: kLightWhite,
                  labelStyle: appStyle(12, kLightWhite, FontWeight.normal),
                  unselectedLabelColor: kGrayLight,
                  tabs: [
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25.h,
                        child: Center(
                          child: Text("Menu"),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        width: width / 2,
                        height: 25.h,
                        child: const Center(
                          child: Text("Explore"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenuWidget(restaurantId: widget.restaurant!.id),
                    ExploreWidget(code: widget.restaurant!.code),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
