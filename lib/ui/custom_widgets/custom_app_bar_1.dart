import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar1 extends StatelessWidget {
  final Widget leadingIcon;
  final Widget title;
  final Widget? trelingIcon1;
  final Widget? trelingIcon2;
  const CustomAppBar1(
      {Key? key,
      required this.leadingIcon,
      required this.title,
      this.trelingIcon1,
      this.trelingIcon2})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20.h,
          width: 20.h,
          child: leadingIcon,
        ),
        SizedBox(width: 16.w),
        title,
        const Spacer(),
        SizedBox(
          height: 20.h,
          width: 20.h,
          child: trelingIcon1 ?? Container(),
        ),
        SizedBox(width: 15.w),
        SizedBox(
          height: 20.h,
          width: 20.h,
          child: trelingIcon2 ?? Container(),
        ),
      ],
    );
  }
}
