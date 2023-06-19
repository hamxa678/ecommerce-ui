import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/other_models/dummy_card_data.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/check_out_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckOutViewModel(context),
      child: Consumer<CheckOutViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: lightGreyColor,
            body: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 69.h, 20.w, 66.h),
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
                    trailingIconAction: (() {
                      Get.back();
                    }),
                    title: Text(
                      "Payment Method",
                      style: kHead2,
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Text(
                    "Select Payment Method",
                    style: kHead3,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    height: 192.h,
                    width: 335.w,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.h, horizontal: 9.w),
                            height: 40.h,
                            width: 96.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: lightGreyColor,
                            ),
                            child: const Image(
                              image: AssetImage(
                                  '${staticImagesAssetsPath}paypal.png'),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text(
                            'PayPal',
                            style: kHead3.copyWith(color: primaryColor),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: Radio(
                              activeColor: primaryColor,
                              groupValue: model.paymentMethod,
                              value: 'paypal',
                              onChanged: ((value) =>
                                  {model.togglePaymentMethod(value)}),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.h, horizontal: 9.w),
                            height: 40.h,
                            width: 96.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: lightGreyColor,
                            ),
                            child: const Image(
                              image: AssetImage(
                                  '${staticImagesAssetsPath}mastercard.png'),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text(
                            'Master Card',
                            style: kHead3.copyWith(color: primaryColor),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: Radio(
                              activeColor: primaryColor,
                              groupValue: model.paymentMethod,
                              value: 'Master Card',
                              onChanged: ((value) =>
                                  {model.togglePaymentMethod(value)}),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 6.h, horizontal: 9.w),
                            height: 40.h,
                            width: 96.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: lightGreyColor,
                            ),
                            child: const Image(
                              image: AssetImage(
                                  '${staticImagesAssetsPath}cash.png'),
                            ),
                          ),
                          SizedBox(
                            width: 25.w,
                          ),
                          Text(
                            'Cash',
                            style: kHead3.copyWith(color: primaryColor),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: Radio(
                              activeColor: primaryColor,
                              groupValue: model.paymentMethod,
                              value: 'cash',
                              onChanged: ((value) =>
                                  {model.togglePaymentMethod(value)}),
                            ),
                          )
                        ],
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  (model.paymentMethod == null)
                      ? Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 316.h,
                            child: Text(
                              'Select payment given above',
                              style: kLinkOrAction.copyWith(
                                  color: const Color(0xff00D2E0)),
                            ),
                          ),
                        )
                      : (model.paymentMethod == 'paypal')
                          ? SizedBox(
                              height: 316.h,
                              child: Text(
                                'PayPal selected',
                                style: kLinkOrAction.copyWith(
                                    color: const Color(0xff00D2E0)),
                              ),
                            )
                          : (model.paymentMethod == 'Master Card')
                              ? SizedBox(
                                  height: 316.h,
                                  child: Column(
                                    children: [
                                      (model.selectedCardId != null)
                                          ? DebitCard(
                                              accountNumber:
                                                  '**** **** **** 2345',
                                              ownerName: debitCardDetailData[
                                                      model.selectedCardId!]
                                                  .name!,
                                              imageURL:
                                                  '${staticImagesAssetsPath}card1.png')
                                          : const SizedBox(),
                                      SizedBox(
                                        height: 15.35.h,
                                      ),
                                      Align(
                                        child: InkWell(
                                          onTap: () {
                                            model.selectCard();
                                          },
                                          child: Text(
                                            'See all list card',
                                            style: kLinkOrAction.copyWith(
                                                color: const Color(0xff00D2E0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ))
                              : SizedBox(
                                  height: 316.h,
                                  child: Text(
                                    'Cash Selected',
                                    style: kLinkOrAction.copyWith(
                                        color: const Color(0xff00D2E0)),
                                  ),
                                ),
                  CustomMainButton(
                      buttonColor: primaryColor,
                      textColor: secondaryColor,
                      onPressed: () {
                        toastFunction();
                      },
                      buttonText: 'Confirm')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DebitCard extends StatelessWidget {
  const DebitCard(
      {Key? key,
      required this.accountNumber,
      required this.ownerName,
      required this.imageURL})
      : super(key: key);
  final String accountNumber;
  final String ownerName;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 212.65.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: whiteColor,
        image: DecorationImage(image: AssetImage(imageURL), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 26.65.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Text(
              accountNumber,
              style: kHead1.copyWith(color: whiteColor, height: 27.h / 24.sp),
            ),
            Text(
              ownerName,
              style: kHead3.copyWith(color: whiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
