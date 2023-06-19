import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/otp_input.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'forget_password_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordSecondScreen extends StatelessWidget {
  const ForgetPasswordSecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ForgetPasswordScreenViewModel(),
      child: Consumer<ForgetPasswordScreenViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: lightGreyColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 68.h, horizontal: 20.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///
                      /// Custom App bar
                      ///
                      CustomAppBar(
                        trailingIcon: SvgPicture.asset(
                            '${staticAssetsPath}arrow-left.svg',
                            fit: BoxFit.scaleDown),
                        trailingIconAction: () {
                          Get.back();
                        },
                        title: Text("Forgot password", style: kHead2),
                      ),

                      ///
                      /// _body contains two Text and a FilledRoundedPinPut widgets
                      ///
                      _body(model),

                      ///
                      /// Custom Main Button
                      ///
                      CustomMainButton(
                          buttonColor: primaryColor,
                          textColor: secondaryColor,
                          onPressed: () {
                            _modalButtomSheet(context);
                          },
                          buttonText: "Submit")
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // body of Forget password second screen

  Widget _body(ForgetPasswordScreenViewModel model) {
    return Column(
      children: [
        SizedBox(height: 24.h),
        Text('Enter OTP sent on\nyour phone.', style: kHead1),
        SizedBox(height: 32.h),
        Center(
          child: FilledRoundedPinPut(
            onCompletion: (pin) {
              model.otp = pin;
            },
          ),
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Resend Code",
            style: kHead4.copyWith(color: linkAndActionColor),
          ),
        ),
        SizedBox(height: 65.h),
      ],
    );
  }

  // Modal Buttom Sheet of Forget password second screen

  Future<dynamic> _modalButtomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 475.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.w, 84.h, 20.w, 32.h),
                  height: 453.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(
                        '${staticAssetsPath}ForgetPassword.svg',
                        fit: BoxFit.scaleDown,
                        height: 120.h,
                        width: 120.w,
                      ),
                      SizedBox(
                        height: 62.h,
                      ),
                      SizedBox(
                        height: 25.h,
                        child: Text(
                          'Reset Password Success',
                          style: kHead2,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      SizedBox(
                        height: 22.h,
                        child: Text(
                          'Leading e-commerce market',
                          style: kBodyM,
                        ),
                      ),
                      const Spacer(),
                      CustomMainButton(
                          buttonColor: primaryColor,
                          textColor: secondaryColor,
                          onPressed: () {},
                          buttonText: 'Continue'),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 25.w,
                child: GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    height: 44.w,
                    width: 44.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: blackColor.withOpacity(0.1),
                            blurRadius: 20.r,
                            spreadRadius: 0,
                            offset: const Offset(0, 10),
                          )
                        ],
                        color: whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(12.r))),
                    child: SvgPicture.asset(
                      '${staticAssetsPath}close.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
