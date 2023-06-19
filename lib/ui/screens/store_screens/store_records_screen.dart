import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreRecordsScreen extends StatelessWidget {
  const StoreRecordsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 16.h),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 20.h),
            width: double.infinity,
            height: 116.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '0%',
                      style: kHead1.copyWith(color: primaryColor),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          'Cancellation rate',
                          style: kBodyS,
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset(
                          '${staticAssetsPath}alert-circle.svg',
                          height: 16.h,
                          width: 16.h,
                          color: greyColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(width: 15.w),
                VerticalDivider(
                  width: 10.w,
                  color: greyColor,
                  thickness: 2.r,
                ),
                SizedBox(width: 45.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '0%',
                      style: kHead1.copyWith(color: primaryColor),
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          'Return rate',
                          style: kBodyS,
                        ),
                        SizedBox(width: 10.w),
                        SvgPicture.asset(
                          '${staticAssetsPath}alert-circle.svg',
                          height: 16.h,
                          width: 16.h,
                          color: greyColor,
                        ),
                        SizedBox(width: 20.w),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                left: 20.w, right: 45.w, top: 20.h, bottom: 20.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Information Store',
                  style: kHead3,
                ),
                SizedBox(height: 12.h),
                InformationStoreDescription(
                    iconName: 'browser.svg', text: 'Membership from five'),
                SizedBox(height: 7.h),
                InformationStoreDetails(
                  details: '2022',
                ),
                SizedBox(height: 16.h),
                InformationStoreDescription(
                    iconName: 'cube-fill.svg', text: 'Product'),
                SizedBox(height: 7.h),
                InformationStoreDetails(
                  details: '2390+ product on sale',
                ),
                SizedBox(height: 16.h),
                InformationStoreDescription(
                    iconName: 'edit-2.svg', text: 'Description of the store'),
                SizedBox(height: 7.h),
                InformationStoreDetails(
                  details:
                      'Buy products from store X online on my app. High quality reputation good price',
                ),
                SizedBox(height: 16.h),
                InformationStoreDescription(
                    iconName: 'people.svg', text: 'Followers'),
                SizedBox(height: 7.h),
                InformationStoreDetails(details: '239k Followers'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class InformationStoreDetails extends StatelessWidget {
  String details;
  InformationStoreDetails({Key? key, required this.details}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 34.h),
      child: Text(
        details,
        style: kBodyM.copyWith(color: blackColor),
      ),
    );
  }
}

// ignore: must_be_immutable
class InformationStoreDescription extends StatelessWidget {
  String iconName;
  String text;
  InformationStoreDescription(
      {Key? key, required this.iconName, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          '$staticAssetsPath$iconName',
          height: 16.h,
          width: 16.h,
          color: greyColor,
        ),
        SizedBox(
          width: 16.w,
        ),
        Text(
          text,
          style: kBodyM,
        )
      ],
    );
  }
}
