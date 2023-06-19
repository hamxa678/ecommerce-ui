import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/social_media_button.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/forget_password/forget_password_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/login/login_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/sign_up/sign_up_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/root/root_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Consumer<LoginViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              backgroundColor: lightGreyColor,
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.fromLTRB(0, 60.h, 0, 56.h),
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
                      /// Body of login page
                      ///
                      _body(model),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }

  Widget _body(LoginViewModel model) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        SizedBox(
          height: 466.h,
          width: double.infinity,
          child: Stack(
            children: [
              ///
              /// Navigator to SignUp page(lower container in stack) i.e. "Create new account".
              ///
              _alreadyHaveAccount(),

              ///
              /// LoginForm container(Upper container in stack).
              ///
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
                height: 412.h,
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
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.r),
                  ),
                ),

                ///
                /// LoginForm
                ///
                child: LoginForm(model: model),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 32.h,
        ),
        Text(
          'OR login in with',
          style: kBodyM.copyWith(color: blackColor),
        ),
        SizedBox(
          height: 16.h,
        ),

        ///
        /// Social Media Authentication
        ///
        SocialMediaAuth(model: model),
      ],
    );
  }

  _alreadyHaveAccount() {
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
            Text(
              'Dont have account? ',
              style: kBodyS,
            ),
            InkWell(
              onTap: () {
                Get.to(() => const SignUpScreen());
              },
              child: Text(
                'Create new account',
                style: kLinkOrAction.copyWith(color: linkAndActionColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({Key? key, required this.model}) : super(key: key);
  final LoginViewModel model;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: model.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 96.h,
            child: Text(
              "Sign in\nto continue.",
              style: kHead1,
            ),
          ),
          CustomTextField(
            validator: model.inputValidation.validateEmail,
            onSaved: (email) {
              model.loginBody.email = email;
            },
            controller: model.emailController,
            hintText: "Email",
            prefexIcon: SvgPicture.asset(
              '${staticAssetsPath}Message.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
          CustomTextField(
            validator: model.inputValidation.validatePassword,
            onSaved: (password) {
              model.loginBody.password = password;
            },
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
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                Get.to(const ForgetPasswordScreen());
              },
              child: Text(
                'Forgot Password?',
                style: kLinkOrAction.copyWith(color: linkAndActionColor),
              ),
            ),
          ),
          SizedBox(height: 3.h),
          CustomMainButton(
              buttonColor: primaryColor,
              textColor: secondaryColor,
              onPressed: () {
                if (model.formKey.currentState!.validate()) {
                  model.formKey.currentState!.save();
                  Get.to(() => const RootScreen());
                }
              },
              buttonText: "Log in")
        ],
      ),
    );
  }
}

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({Key? key, required this.model}) : super(key: key);
  final LoginViewModel model;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialMediaButtom(
            child: SvgPicture.asset(
              '${staticAssetsPath}google.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () {}),
        SizedBox(
          width: 16.w,
        ),
        SocialMediaButtom(
            child: SvgPicture.asset(
              '${staticAssetsPath}facebook.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () {}),
        SizedBox(
          width: 16.w,
        ),
        SocialMediaButtom(
            child: SvgPicture.asset(
              '${staticAssetsPath}apple.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () {}),
      ],
    );
  }
}
