import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TermsOfUse extends StatelessWidget {
  const TermsOfUse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGreyColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 24.h),
          child: Column(
            children: [
              CustomAppBar(
                trailingIcon: SvgPicture.asset(
                  '${staticAssetsPath}arrow-left.svg',
                  fit: BoxFit.scaleDown,
                ),
                trailingIconAction: (() {
                  Get.back();
                }),
                title: Text("Terms of use", style: kHead2),
              ),

              ///
              ///Body of Terms and conditions screen
              ///
              _body(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.only(top: 48.h),
      child: Column(
        children: [
          Image(
            image: const AssetImage('${staticImagesAssetsPath}TOU.png'),
            height: 120.h,
            width: 120.w,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(height: 40.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('1. Introduce', style: kHead3),
                SizedBox(height: 12.h),
                Text(
                  'When you access our website, I mean you agree to the terms. The Website reserves the right to change, edit, add or remove any part of these Terms of Sale at any time. Changes take effect as soon as they are posted on the website without prior notice. And when you continue to use the website, after the changes to these Terms are posted, it means you accept with such changes.',
                  textAlign: TextAlign.justify,
                  style: kBodyM,
                ),
              ],
            ),
          ),
          SizedBox(height: 14.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('2. Accept orders and prices', style: kHead3),
                SizedBox(height: 12.h),
                Text(
                  "We reserve the right to refuse or cancel your order for any reason related to technical error, system objectively at any time. In addition, to ensure fairness to Tiki's end-consumer customers, we will also refuse orders that are not for personal use, bulk purchases or for purchase. go and resell. We are committed to providing the most accurate price information for consumers. However, sometimes mistakes do occur, for example, when the product price is not displayed correctly on the website or the price is wrong, depending on each case we will contact the instruction or notice to cancel the order. that for you. We also reserve the right to refuse or cancel any order whether or not it has been confirmed or paid.",
                  textAlign: TextAlign.justify,
                  style: kBodyM,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
