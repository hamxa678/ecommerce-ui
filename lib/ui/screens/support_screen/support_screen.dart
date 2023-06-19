import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/support_screen/support_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SuportScreen extends StatelessWidget {
  const SuportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SupportViewModel(),
      child: Consumer<SupportViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: lightGreyColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 24.h),
              child: Column(
                children: [
                  // Custom App Bar
                  CustomAppBar(
                    trailingIcon: SvgPicture.asset(
                      '${staticAssetsPath}arrow-left.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    trailingIconAction: (() {
                      Get.back();
                    }),
                    title: Text(
                      "Support",
                      style: kHead2,
                    ),
                  ),
                  SizedBox(height: 28.h),
                  _containerFAQ(model),
                  SizedBox(height: 14.h),
                  _contactUsContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _containerFAQ(SupportViewModel model) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: whiteColor),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'FAQ',
          style: kHead3,
        ),
        SizedBox(height: 12.h),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.only(top: 0),
          shrinkWrap: true,
          itemCount: model.noOfFAQ,
          itemBuilder: ((context, index) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.faq[index], style: kBodyM),
                  SizedBox(height: 16.h),
                ],
              )),
        ),
        (model.faq.length > 6)
            ? Center(
                child: InkWell(
                  onTap: () {
                    model.seeMoreFAQ();
                  },
                  child: Text((model.seeMoreFlag) ? 'See less' : 'See more',
                      style: kDisplayTitle.copyWith(color: linkAndActionColor)),
                ),
              )
            : const SizedBox(),
      ]),
    );
  }

  Widget _contactUsContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r), color: whiteColor),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Us',
            style: kHead3,
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xFFFDD446).withOpacity(0.08)),
                child: SvgPicture.asset(
                  '${staticIconsAssetsPath}message-fill.svg',
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                height: 42.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chat App now', style: kHead4),
                    Text('You can chat with us here', style: kBodyS)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xFFF6565D).withOpacity(0.08)),
                child: SvgPicture.asset(
                  '${staticIconsAssetsPath}email-fill.svg',
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                height: 42.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Send Email', style: kHead4),
                    Text('Send your question or problem', style: kBodyS)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Container(
                height: 48.h,
                width: 48.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: const Color(0xFFA1DBF5).withOpacity(0.08)),
                child: SvgPicture.asset(
                  '${staticIconsAssetsPath}phone-fill.svg',
                  height: 20.h,
                  width: 20.w,
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(width: 16.w),
              SizedBox(
                height: 42.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Costumer Service', style: kHead4),
                    Text('1800806', style: kBodyS)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
