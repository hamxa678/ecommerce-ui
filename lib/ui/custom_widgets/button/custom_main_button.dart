// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/styles.dart';

// ignore: must_be_immutable
class CustomMainButton extends StatelessWidget {
  CustomMainButton(
      {Key? key,
      required this.buttonColor,
      required this.textColor,
      required this.onPressed,
      required this.buttonText,
      this.border = false,
      this.height = 56})
      : super(key: key);
  final buttonText;
  final buttonColor;
  final textColor;
  final onPressed;
  bool? border;
  double? height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height!.h,
        decoration: BoxDecoration(
            color: buttonColor,
            border: (border == true)
                ? Border.all(width: 1, color: primaryColor)
                : null,
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Center(
          child: Text(
            buttonText,
            style: kHead3.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
