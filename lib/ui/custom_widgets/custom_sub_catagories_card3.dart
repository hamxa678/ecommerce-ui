import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';

class CustomSubCategoriesCard extends StatelessWidget {
  const CustomSubCategoriesCard(
      {Key? key,
      required this.title,
      required this.textColor,
      required this.image1,
      required this.image2,
      required this.image3})
      : super(key: key);
  final String title;
  final String image1;
  final String image2;
  final String image3;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
      height: 104.h,
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        color: whiteColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor),
                child: Image(
                  image: AssetImage(image1),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor),
                child: Image(
                  image: AssetImage(image2),
                ),
              ),
              SizedBox(
                width: 6.w,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                height: 44.h,
                width: 44.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor),
                child: Image(
                  image: AssetImage(image3),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(
            title,
            style: kLinkOrAction.copyWith(color: textColor),
          )
        ],
      ),
    );
  }
}
