import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/styles.dart';

class CustomCardP extends StatelessWidget {
  const CustomCardP(
      {Key? key,
      required this.title,
      required this.price,
      required this.discount,
      required this.imagePath})
      : super(key: key);
  final String title;
  final String price;
  final String discount;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 16.w,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(9.w, 16.h, 8.w, 20.h),
          height: 158.h,
          width: 116.w,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image(
                  width: 74.67.w,
                  height: 48.h,
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 12.h,
              ),
              SizedBox(
                height: 38.h,
                child: AutoSizeText(
                  title,
                  style: kBodyS.copyWith(color: blackColor),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              FittedBox(
                child: SizedBox(
                  height: 20.h,
                  child: Row(
                    children: [
                      Text(
                        price,
                        style: kHead4.copyWith(color: primaryColor),
                      ),
                      SizedBox(
                        width: 4.h,
                      ),
                      Text(discount, style: kBodyS),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
