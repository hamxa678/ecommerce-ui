import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomBottomButton extends StatelessWidget {
  VoidCallback onTap;
  String name;
  CustomBottomButton({Key? key, required this.onTap, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20.w),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          color: primaryColor,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            name,
            style: kHead3.copyWith(color: secondaryColor),
          ),
        ),
      ),
    );
  }
}
