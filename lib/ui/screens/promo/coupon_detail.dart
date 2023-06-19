import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/promo/promo_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class CouponDetailScreen extends StatelessWidget {
  const CouponDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PromoScreenViewModel(),
        child: Consumer<PromoScreenViewModel>(
          builder: (context, model, child) => ModalProgressHUD(
            inAsyncCall: model.state == ViewState.busy,
            child: Scaffold(
              body: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 31.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(
                      trailingIcon: SvgPicture.asset(
                        '${staticAssetsPath}arrow-left.svg',
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                      trailingIconAction: () {
                        Get.back();
                      },
                      title: Text(
                        "Detail Coupon",
                        style: kHead2,
                      ),
                    ),
                    SizedBox(height: 40.h),
                    Align(
                      alignment: Alignment.center,
                      child: Image(
                        image: const AssetImage(
                            '${staticImagesAssetsPath}Coupon.png'),
                        height: 32.h,
                        width: 234.w,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Text(
                      '50% off on sneakers - limited sale',
                      style: kHead1.copyWith(color: primaryColor),
                    ),
                    SizedBox(height: 20.h),
                    SizedBox(
                      height: 54.h,
                      width: 247.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 31.h,
                                child: Text('84',
                                    style:
                                        kHead2.copyWith(color: primaryColor)),
                              ),
                              SizedBox(
                                height: 19.h,
                                child: Text('People Used Today',
                                    style: kBodyS.copyWith(color: blackColor)),
                              )
                            ],
                          ),
                          VerticalDivider(
                              color: lightGreyColor, thickness: 2.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 31.h,
                                child: Text('20',
                                    style:
                                        kHead2.copyWith(color: primaryColor)),
                              ),
                              SizedBox(
                                height: 19.h,
                                child: Text('Comments',
                                    style: kBodyS.copyWith(color: blackColor)),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(thickness: 1.h, color: lightGreyColor),
                    SizedBox(height: 16.h),
                    Text('Form Nov 15 to Dec 14',
                        style: kBodyM.copyWith(color: blackColor)),
                    SizedBox(height: 16.h),
                    Divider(thickness: 1.h, color: lightGreyColor),
                    SizedBox(height: 16.h),
                    Text('Display this offer to the staff  and show them code',
                        style: kBodyM),
                    SizedBox(height: 16.h),
                    Row(
                      children: [
                        Text('YOUR COUPON CODE',
                            style: kHead4.copyWith(color: primaryColor)),
                        const Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Text('Copy Code',
                              style: kLinkOrAction.copyWith(
                                  color: linkAndActionColor)),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text('BlackFriday30',
                        style: kHead1.copyWith(color: tertiaryColorRed)),
                    SizedBox(height: 16.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      height: 84.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: lightGreyColor),
                      child: AutoSizeText(
                          'Cannot be used in connjunction with other discounts or offers',
                          maxLines: 2,
                          style: kBodyM),
                    ),
                    SizedBox(height: 32.h),
                    CustomMainButton(
                        buttonColor: primaryColor,
                        textColor: secondaryColor,
                        onPressed: () {
                          toastFunction();
                        },
                        buttonText: 'Use Code')
                  ],
                ),
              )),
            ),
          ),
        ));
  }
}
