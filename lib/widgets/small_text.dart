import 'package:flutter/material.dart';
import 'package:fmb/utils/dimensions.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size = 0;
  double height;

  SmallText({
    Key? key,
    this.height = 1.2,
    required this.text,
    this.color = const Color(0xFFccc7c5),
    this.size = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size == 0 ? Dimensions.font10 : size,
        fontFamily: 'Roboto',
        height: height,
      ),
    );
  }
}
