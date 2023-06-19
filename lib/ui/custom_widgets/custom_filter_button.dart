import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/strings.dart';
import '../../core/constants/styles.dart';

// ignore: must_be_immutable
class CustomFilterButton extends StatelessWidget {
  CustomFilterButton(
      {Key? key,
      required this.filterResults,
      required this.filterText,
      required this.onTapFilter})
      : super(key: key);
  int filterResults;
  String filterText;
  VoidCallback onTapFilter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      height: 68.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        color: whiteColor.withOpacity(0.6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            '${staticAssetsPath}funnel-fill.svg',
            fit: BoxFit.scaleDown,
            color: greyColor,
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
            onTap: onTapFilter,
            child: Text(
              'Filter',
              style: kHead3.copyWith(height: 1.3),
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          Text(
            filterText,
            style: kBodyM,
          ),
          const Spacer(),
          Text(
            '$filterResults Results',
            style: kBodyM,
          ),
        ],
      ),
    );
  }
}
