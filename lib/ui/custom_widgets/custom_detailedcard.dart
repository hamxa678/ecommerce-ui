import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/colors.dart';

class CustomDetailedCard extends StatelessWidget {
  const CustomDetailedCard(
      {Key? key,
      required this.title,
      required this.rating,
      required this.noOfRating,
      required this.newPrice,
      required this.discountPercentage,
      required this.imageURL,
      required this.installmentPercent})
      : super(key: key);
  final String title;
  final double rating;
  final int noOfRating;
  final double newPrice;
  final int discountPercentage;
  final String imageURL;
  final int installmentPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 11.w, 20.h),
      // height: 252.h,
      // width: 160.w,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Column(children: [
        Image(
          image: AssetImage(imageURL),
          fit: BoxFit.scaleDown,
          height: 80.h,
          width: 80.h,
        ),
        SizedBox(
          height: 8.h,
        ),
        SizedBox(
          height: 40.h,
          child: AutoSizeText(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: kHead4.copyWith(height: 1.4.h),
          ),
        ),
        SizedBox(height: 4.h),
        SizedBox(
          height: 20.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                '${staticAssetsPath}Star.svg',
              ),
              SizedBox(
                width: 8.w,
              ),
              AutoSizeText(
                '$rating ',
                style: kBodyM.copyWith(color: primaryColor),
                maxLines: 1,
              ),
              AutoSizeText(
                '(${noOfRating}k rating)',
                maxLines: 1,
                style: kBodyM,
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 24.h,
          child: Row(
            children: [
              Text(
                "\$$newPrice",
                style: kHead3.copyWith(color: primaryColor),
              ),
              SizedBox(
                width: 4.w,
              ),
              Text(
                "$discountPercentage%",
                style: kSubText,
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 20.h,
          child: Row(
            children: [
              SvgPicture.asset(
                '${staticAssetsPath}fire-fill.svg',
              ),
              SizedBox(
                width: 8.w,
              ),
              Text(
                '$installmentPercent% installment',
                style: kBodyS.copyWith(color: blackColor),
              )
            ],
          ),
        )
      ]),
    );
  }
}
