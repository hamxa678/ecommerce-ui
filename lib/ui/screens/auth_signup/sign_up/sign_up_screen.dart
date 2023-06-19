import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/sign_up/sign_up_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/sign_up/terms_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/login/login_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/root/root_screen.dart';
import 'package:flutter_antonx_boilerplate/core/models/dropdown_model.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpViewModel(),
      child: Consumer<SignUpViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              backgroundColor: lightGreyColor,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 60.h, 0, 25.h),
                  child: Column(
                    children: [
                      ///
                      /// Logo Image
                      ///
                      SvgPicture.asset(
                        '${staticAssetsPath}Logo LS.svg',
                        height: 52.h,
                        width: 52.w,
                        fit: BoxFit.scaleDown,
                      ),

                      ///
                      /// Body of Sign Up Screen
                      _body(model),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget _body(SignUpViewModel model) {
    return Form(
      key: model.formKey,
      child: Column(
        children: [
          SizedBox(height: 24.h),
          SizedBox(
            height: 680.h,
            width: double.infinity,
            child: Stack(
              children: [
                _stackBottomContainer(),
                _signUpTextForm(model),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stackBottomContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 54.h,
        width: 319.w,
        decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.6),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.r),
            bottomRight: Radius.circular(16.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('I already have an account. ', style: kBodyS),
            InkWell(
              onTap: () {
                Get.to(() => const LoginScreen());
              },
              child: Text(
                'Sign in',
                style: kLinkOrAction.copyWith(color: linkAndActionColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _signUpTextForm(SignUpViewModel model) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      height: 626.h,
      width: 335.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: blackColor.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 20.r,
            offset: const Offset(0, 10), // changes position of shadow
          ),
        ],
        color: whiteColor,
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 96.h,
              child: Text(
                "Create new\nAccount.",
                style: kHead1,
              ),
            ),
            CustomTextField(
              controller: model.userNameController,
              hintText: "Username",
              prefexIcon: SvgPicture.asset(
                '${staticAssetsPath}person-fill.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            CustomTextField(
              controller: model.emailController,
              hintText: "Email",
              prefexIcon: SvgPicture.asset(
                '${staticAssetsPath}Message.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            CustomTextField(
              controller: model.phoneController,
              hintText: "Phone",
              prefexIcon: SvgPicture.asset(
                '${staticAssetsPath}phone-fill.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            DropdownButtonExample(model: model),
            CustomTextField(
              controller: model.passwordController,
              hintText: "Password",
              prefexIcon: SvgPicture.asset(
                '${staticAssetsPath}lock-fill.svg',
                fit: BoxFit.scaleDown,
              ),
              obscureText: model.passwordVisibility,
              suffexIcon: GestureDetector(
                onTap: () {
                  model.togglePasswordVisibility();
                },
                child: SvgPicture.asset(
                  model.passwordVisibility
                      ? '${staticAssetsPath}eye.svg'
                      : '${staticAssetsPath}eye-off.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24.h,
                  width: 24.h,
                  child: Checkbox(
                    value: model.checkBoxValue,
                    activeColor: primaryColor,
                    onChanged: (newValue) {
                      model.toggleCheckBox();
                    },
                  ),
                ),
                SizedBox(width: 8.w),
                SizedBox(
                  height: 38.h,
                  width: 250.w,
                  child: Text.rich(
                    TextSpan(
                        text: "By registering you have accepted to use the ",
                        children: [
                          TextSpan(
                            text: "terms",
                            style: kLinkOrAction.copyWith(
                                color: linkAndActionColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Get.to(const TermsOfUse());
                              },
                          )
                        ]),
                    style: kBodyS,
                  ),
                )
              ],
            ),
            const SizedBox(),
            CustomMainButton(
                buttonColor: primaryColor,
                textColor: secondaryColor,
                onPressed: () {
                  Get.to(() => const RootScreen());
                },
                buttonText: "Create Account"),
          ],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatelessWidget {
  const DropdownButtonExample({Key? key, required this.model})
      : super(key: key);
  final SignUpViewModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 14.w),
      height: 48.h,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          color: lightGreyColor),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            prefixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
              height: 16.h,
              width: 16.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image(
                  image: AssetImage(model.flagPath!),
                  fit: BoxFit.cover,
                ),
              ),
            )),
        value: model.dropdownValue,
        icon: SvgPicture.asset(
          '${staticAssetsPath}arrow-down-fill.svg',
        ),
        style: kHead4,
        onChanged: (String? value) {
          // This is called when the user selects an item.
          model.toggleCountry(value);
        },
        items: model.data.map<DropdownMenuItem<String>>((DropDownModel value) {
          return DropdownMenuItem<String>(
            onTap: () {
              model.flagPath = value.imagePath;
            },
            value: value.countryName,
            child: Text(value.countryName),
          );
        }).toList(),
      ),
    );
  }
}
