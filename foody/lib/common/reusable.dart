import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  final dynamic text;
  final TextStyle style;

  const ReusableText({Key? key, required this.text, required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      softWrap: false,
      textAlign: TextAlign.left,
      style: style,
    );
  }
}
