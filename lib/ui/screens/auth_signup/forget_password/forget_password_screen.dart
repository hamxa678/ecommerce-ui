import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/forget_password/forget_password_secondscreen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/strings.dart';
import 'forget_password_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

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
                      CustomAppBar(
                          trailingIcon: SvgPicture.asset(
                            '${staticAssetsPath}arrow-left.svg',
                            fit: BoxFit.scaleDown,
                          ),
                          trailingIconAction: () {
                            Get.back();
                          },
                          title: Text(
                            "Forgot password",
                            style: kHead2,
                          )),
                      SizedBox(height: 24.h),
                      Text(
                        'Continue using\nPhone Number.',
                        style: kHead1,
                      ),
                      SizedBox(height: 32.h),
                      CustomTextField(
                        textFieldColor: whiteColor,
                        controller: model.phoneController,
                        hintText: "+92 1110011010",
                        prefexIcon: SvgPicture.asset(
                          '${staticAssetsPath}phone-fill.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(height: 118.h),
                      CustomMainButton(
                          buttonColor: primaryColor,
                          textColor: secondaryColor,
                          onPressed: () {
                            Get.to(const ForgetPasswordSecondScreen());
                          },
                          buttonText: "Send Verification Code")
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
