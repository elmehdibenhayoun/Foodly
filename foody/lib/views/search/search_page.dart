import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foody/common/custom_text_field.dart';
import 'package:foody/common/shimmers/foodlist_shimmer.dart';
import 'package:foody/controllers/search_controller.dart';
import 'package:foody/views/search/loading_widget.dart';
import 'package:foody/views/search/search_result.dart';
import 'package:get/get.dart';

import '../../common/custom_container.dart';
import '../../constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(
      () => Scaffold(
          backgroundColor: kPrimary,
          appBar: AppBar(
            toolbarHeight: 74.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: CustomTextWidget(
                controller: _searchcontroller,
                keyboardType: TextInputType.text,
                hintText: "Search For Foods",
                suffixIcon: GestureDetector(
                    onTap: () {
                      if (controller.isTriggered == false) {
                        controller.searchFoods(_searchcontroller.text);
                        controller.setTrigger = true;
                      } else {
                        controller.searchResults = null;
                        controller.setTrigger = false;
                        _searchcontroller.clear();
                      }
                    },
                    child: controller.isTriggered == false
                        ? Icon(
                            Ionicons.search_circle,
                            size: 40.h,
                            color: kPrimary,
                          )
                        : Icon(Ionicons.close_circle, size: 40.h, color: kRed)),
              ),
            ),
          ),
          body: SafeArea(
            child: CustomContainer(
                color: Colors.white,
                containerContent: controller.isLoading
                    ? const FoodsListShimmer()
                    : controller.searchResults == null
                        ? const LoadingWidget()
                        : const SearchResult()),
          )),
    );
  }
}
