import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/styles.dart';

// ignore: must_be_immutable
class CustomProductTypeBar extends StatelessWidget {
  String productType;
  String? seeMore;
  Widget? leadingIcon;
  Widget? trelingIcon;

  CustomProductTypeBar(
      {Key? key,
      required this.productType,
      this.seeMore,
      this.leadingIcon,
      this.trelingIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Row(
        children: [
          leadingIcon ?? Container(),
          Text(
            productType,
            style: kHead3,
          ),
          const Spacer(),
          seeMore != null ? Text(seeMore!, style: kBodyS) : Container(),
          SizedBox(
            height: 16.h,
            width: 16.h,
            child: trelingIcon ?? Container(),
          )
        ],
      ),
    );
  }
}
