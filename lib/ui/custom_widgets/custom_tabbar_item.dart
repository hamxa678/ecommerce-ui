import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';

// ignore: must_be_immutable
class CustomTabbarItem extends StatelessWidget {
  VoidCallback onTap;
  String text;
  int selectIndex;
  TextStyle style;
  double indexNumber;
  double bottomwidth;
  CustomTabbarItem(
      {Key? key,
      required this.onTap,
      required this.text,
      required this.selectIndex,
      required this.style,
      required this.indexNumber,
      required this.bottomwidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: Text(
            text,
            style: style.copyWith(
              color: selectIndex == indexNumber ? primaryLightColor : greyColor,
            ),
          ),
        ),
        SizedBox(height: 6.h),
        selectIndex == indexNumber
            ? SizedBox(
                height: 3.h,
                width: bottomwidth,
                child: SvgPicture.asset(
                  '${staticAssetsPath}Rectangle 29.svg',
                  fit: BoxFit.cover,
                ),
              )
            : SizedBox(
                height: 3.h,
                width: bottomwidth,
              ),
      ],
    );
  }
}
