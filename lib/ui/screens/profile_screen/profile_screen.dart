import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/cart/cart_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/notification/notification_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/profile_screen/personal_info.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/profile_screen/profile_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/support_screen/support_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 300.h,
                  child: Stack(
                    children: [
                      Container(
                        height: 260.h,
                        color: primaryColor,
                      ),
                      Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 12.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// =========================================  Custom App bar  =========================================
                                CustomAppBar(
                                    trailingIcon: SvgPicture.asset(
                                      '${staticAssetsPath}Home logo.svg',
                                      height: 32.h,
                                      width: 32.h,
                                    ),
                                    title: Text(
                                      "Profile",
                                      style: kHead2.copyWith(color: whiteColor),
                                    ),
                                    leadingFirstIcon: SvgPicture.asset(
                                      '${staticAssetsPath}bell-fill.svg',
                                      height: 20.h,
                                      width: 20.h,
                                    ),
                                    leadingFirstIconAction: (() {
                                      Get.to(() => const NotificationScreen());
                                    }),
                                    leadingSecondIcon: SvgPicture.asset(
                                      '${staticAssetsPath}shopping-cart-fill.svg',
                                      color: whiteColor,
                                      height: 20.h,
                                      width: 20.h,
                                    ),
                                    leadingSecondIconAction: (() {
                                      Get.to(const CartScreen());
                                    })),
                                SizedBox(
                                  height: 31.h,
                                ),
                                _profileHeader(model),
                              ],
                            ),
                          ),
                        ],
                      ),

                      /// ====================================================  Profile bar  ===========================================
                      _profileBar(model),
                    ],
                  ),
                ),
                SizedBox(height: 18.h),

                /// ==========================================================  First Card  ===========================================
                _firstCard(model),
                _secondCard(model),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: CustomMainButton(
                      border: true,
                      buttonColor: whiteColor,
                      textColor: primaryColor,
                      onPressed: () {
                        Get.to(const SuportScreen());
                      },
                      buttonText: 'Log Out'),
                ),
                SizedBox(height: (19 + 68).h),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

Widget _profileHeader(ProfileViewModel model) {
  return SizedBox(
    height: 77.h,
    width: double.infinity,
    child: Row(
      children: [
        SizedBox(
          height: 60.h,
          width: 60.w,
          child: const CircleAvatar(
            backgroundImage: AssetImage(
              '${staticImagesAssetsPath}hamza.jpeg',
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 24.h,
              child: Text(
                'Hamza Khan',
                style: kHead3.copyWith(color: whiteColor),
                maxLines: 1,
              ),
            ),
            SizedBox(
              height: 22.h,
              child: Text(
                '4127K followers',
                style: kBodyM.copyWith(color: whiteColor),
                maxLines: 1,
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(const PersonnelInfoPage());
              },
              child: SizedBox(
                height: 24.h,
                child: Text(
                  'Personal Info',
                  style: kHead3.copyWith(color: secondaryColor),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          height: 32.h,
          width: 108.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: secondaryColor),
          child: Center(
            child: Text(
              'Seller account',
              style: kLinkOrAction.copyWith(color: blackColor),
            ),
          ),
        )
      ],
    ),
  );
}

Widget _profileBar(ProfileViewModel model) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      height: 80.h,
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 20.r,
              spreadRadius: 0,
              offset: Offset(0, 10.h),
            )
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xff6EA2FF).withOpacity(0.08)),
            child: Center(
              child: SvgPicture.asset(
                '${staticIconsAssetsPath}bag.svg',
                height: 20.h,
                width: 20.w,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
                child: Text(
                  '1000',
                  style: kHead2.copyWith(color: primaryColor),
                ),
              ),
              SizedBox(
                height: 19.h,
                child: Text(
                  'Coin',
                  style: kBodyS,
                ),
              )
            ],
          ),
          const Spacer(),
          const VerticalDivider(color: lightGreyColor, thickness: 1),
          const Spacer(),
          Container(
            height: 40.h,
            width: 40.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: const Color(0xffFDD446).withOpacity(0.08)),
            child: Center(
              child: SvgPicture.asset(
                '${staticIconsAssetsPath}book.svg',
                height: 20.h,
                width: 20.w,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 32.h,
                child: Text(
                  'Gold',
                  style: kHead2.copyWith(color: primaryColor),
                ),
              ),
              SizedBox(
                height: 19.h,
                child: Text(
                  'Loyalty program',
                  style: kBodyS,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget _firstCard(ProfileViewModel model) {
  return Container(
    height: 197.h,
    margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r), color: whiteColor),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: 20.h,
          child: Row(
            children: [
              SvgPicture.asset(
                '${staticIconsAssetsPath}pglobe.svg',
                height: 16.h,
                width: 16.w,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(width: 16.w),
              Text(
                'Social Network Connection',
                style: kHead4,
              )
            ],
          )),
      SizedBox(
          height: 46.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                '${staticIconsAssetsPath}pricetag.svg',
                height: 16.h,
                width: 16.w,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(width: 16.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                    child: Text(
                      'Promotion Code',
                      style: kHead4,
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
                    child: Text(
                      'You have 4 promotionãls cards',
                      style: kBodyM,
                    ),
                  ),
                ],
              )
            ],
          )),
      SizedBox(
          height: 20.h,
          child: Row(
            children: [
              SvgPicture.asset(
                '${staticIconsAssetsPath}pgift.svg',
                height: 16.h,
                width: 16.w,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(width: 16.w),
              Text(
                'Bonus Gift',
                style: kHead4,
              )
            ],
          )),
      SizedBox(
          height: 20.h,
          child: Row(
            children: [
              SvgPicture.asset(
                '${staticIconsAssetsPath}layers.svg',
                height: 16.h,
                width: 16.w,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(width: 16.w),
              Text(
                'Order Management',
                style: kHead4,
              )
            ],
          )),
    ]),
  );
}

Widget _secondCard(ProfileViewModel model) {
  return Container(
    height: 240.h,
    margin: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r), color: whiteColor),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
          height: 20.h,
          child: Row(
            children: [
              Text(
                'Reviews of Purchased products ',
                style: kHead4,
              ),
              const Spacer(),
              SvgPicture.asset(
                '${staticIconsAssetsPath}right.svg',
                height: 20.h,
                width: 20.w,
                fit: BoxFit.scaleDown,
              ),
            ],
          )),
      SizedBox(
          height: 20.h,
          child: Row(
            children: [
              Text(
                'Recently viewed products',
                style: kHead4,
              ),
              const Spacer(),
              SvgPicture.asset(
                '${staticIconsAssetsPath}right.svg',
                height: 20.h,
                width: 20.w,
                fit: BoxFit.scaleDown,
              ),
            ],
          )),
      SizedBox(
          height: 20.h,
          child: Row(
            children: [
              Text(
                'Billing Information',
                style: kHead4,
              ),
              const Spacer(),
              SvgPicture.asset(
                '${staticIconsAssetsPath}right.svg',
                height: 20.h,
                width: 20.w,
                fit: BoxFit.scaleDown,
              ),
            ],
          )),
      SizedBox(
        height: 20.h,
        child: Row(
          children: [
            Text(
              'Setting',
              style: kHead4,
            ),
            const Spacer(),
            SvgPicture.asset(
              '${staticIconsAssetsPath}right.svg',
              height: 20.h,
              width: 20.w,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
        child: Row(
          children: [
            Text(
              'Terms of user',
              style: kHead4,
            ),
            const Spacer(),
            SvgPicture.asset(
              '${staticIconsAssetsPath}right.svg',
              height: 20.h,
              width: 20.w,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20.h,
        child: Row(
          children: [
            Text(
              'Support',
              style: kHead4,
            ),
            const Spacer(),
            SvgPicture.asset(
              '${staticIconsAssetsPath}right.svg',
              height: 20.h,
              width: 20.w,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
    ]),
  );
}
