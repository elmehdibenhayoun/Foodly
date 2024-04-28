import 'package:flutter/material.dart';
import 'package:foody/common/reusable.dart';
import 'package:foody/common/style_app.dart';
import 'package:foody/constants/constants.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.first, required this.second});
  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ReusableText(
          text: first,
          style: appStyle(10, kGray, FontWeight.w500),
        ),
        ReusableText(
          text: second,
          style: appStyle(10, kGray, FontWeight.w500),
        ),
      ],
    );
  }
}
