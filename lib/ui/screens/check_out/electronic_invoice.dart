import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/check_out_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class ElectronicInvoiceScreen extends StatelessWidget {
  const ElectronicInvoiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckOutViewModel(context),
      child: Consumer<CheckOutViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            bottomNavigationBar: BottomAppBar(
                child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 26.h, 20.w, 33.h),
              height: 177.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomMainButton(
                              height: 44.h,
                              buttonColor: lightGreyColor,
                              textColor: primaryColor,
                              onPressed: () {},
                              buttonText: 'Contact'),
                        ),
                        SizedBox(width: 14.w),
                        Expanded(
                          child: CustomMainButton(
                              height: 44.h,
                              buttonColor: lightGreyColor,
                              textColor: primaryColor,
                              onPressed: () {},
                              buttonText: 'Rating'),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.w),
                    CustomMainButton(
                        buttonColor: primaryColor,
                        textColor: secondaryColor,
                        onPressed: () {},
                        buttonText: "Done")
                  ]),
            )),
            backgroundColor: lightGreyColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 69.h, 20.w, 0),
                child: Column(children: [
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
                      "Check Out",
                      style: kHead2,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 4.h, horizontal: 8.w),
                        height: 15.h,
                        width: 15.h,
                        child: Checkbox(
                          value: model.checkBoxValue,
                          activeColor: primaryColor,
                          onChanged: (newValue) {
                            model.toggleCheckBox();
                          },
                        ),
                      ),
                      SizedBox(
                        width: 242.w,
                        child: Text(
                            'Invoice address is the same as receiving address',
                            style: kBodyS.copyWith(color: greyColor)),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                    height: 289.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: whiteColor),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Invoice information', style: kHead3),
                          CustomTextField(
                              prefexIcon: SvgPicture.asset(
                                  '${staticIconsAssetsPath}COshield.svg',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.scaleDown),
                              hintText: 'Company name'),
                          CustomTextField(
                              prefexIcon: SvgPicture.asset(
                                  '${staticIconsAssetsPath}CObag.svg',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.scaleDown),
                              hintText: 'Tax code'),
                          CustomTextField(
                              prefexIcon: SvgPicture.asset(
                                  '${staticIconsAssetsPath}POLocation.svg',
                                  height: 20.h,
                                  width: 20.w,
                                  fit: BoxFit.scaleDown),
                              hintText: 'Address'),
                          Align(
                            alignment: Alignment.center,
                            child: InkWell(
                              onTap: () {
                                toastFunction();
                              },
                              child: Text('Detail',
                                  style: kLinkOrAction.copyWith(
                                      color: linkAndActionColor)),
                            ),
                          )
                        ]),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    margin: EdgeInsets.only(bottom: 22.h),
                    padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 38.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: whiteColor),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Note:', style: kHead3),
                          SizedBox(height: 16.h),
                          Text(
                              'For products belonging to suppliers other than X, you will be supported with invoice issuance within 14 days from the time of successful receipt of goods and no need to return.',
                              style: kBodyM),
                          SizedBox(height: 15.h),
                          Text(
                              'In case the customer does not enter invoice information, X Trading will issue an invoice according to the purchase information',
                              style: kBodyM)
                        ]),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
