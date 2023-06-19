import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextButton1 extends StatelessWidget {
  VoidCallback onTap;
  Color color;
  String text;
  TextStyle style;
  double height;
  double width;
  double radius;
  CustomTextButton1({
    Key? key,
    required this.onTap,
    required this.color,
    required this.text,
    required this.style,
    required this.height,
    required this.width,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          text,
          style: style,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
