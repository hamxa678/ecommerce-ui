// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/models/other_models/onboarding.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/sign_up/sign_up_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/onboarding/onboarding_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/styles.dart';
import '../../custom_widgets/button/custom_main_button.dart';
import '../auth_signup/login/login_screen.dart';

///
/// Flow logic is already done. Just need
/// to add the UI and UI Logic.
///

class OnboardingScreen extends StatefulWidget {
  final int currentIndex;
  final List<Onboarding> onboardingList;
  final List<Widget> preCachedImages;
  const OnboardingScreen({
    Key? key,
    this.currentIndex = 0,
    required this.onboardingList,
    required this.preCachedImages,
  }) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('@onboardingScreen');
    return ChangeNotifierProvider(
      create: (context) =>
          // ignore: unnecessary_this
          OnboardingViewModel(widget.currentIndex, this.widget.onboardingList),
      child: Consumer<OnboardingViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 65.h),
                SizedBox(
                  height: 411.h,
                  width: double.infinity,
                  child: PageView(
                    onPageChanged: (index) {
                      model.updatePage(index);
                    },
                    controller: model.controllerPV,
                    children: widget.preCachedImages,
                  ),
                ),
                SizedBox(
                  height: 47.h,
                ),
                Text(
                  "${model.onboardingList[model.currentPageIndex].title}",
                  style: kHead1,
                ),
                SizedBox(
                  height: 16.h,
                ),
                SizedBox(
                  width: 232.w,
                  height: (76 + 44 - 12).h,
                  child: Text(
                    '${model.onboardingList[model.currentPageIndex].description}',
                    textAlign: TextAlign.center,
                    style: kBodyM,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomMainButton(
                            buttonText: "Join now",
                            buttonColor: lightGreyColor,
                            textColor: primaryColor,
                            onPressed: () {
                              Get.to(()=> const SignUpScreen());
                            }),
                      ),
                      SizedBox(
                        width: 15.w,
                      ),
                      Expanded(
                        child: CustomMainButton(
                            buttonText: "Log in",
                            buttonColor: primaryColor,
                            textColor: lightGreyColor,
                            onPressed: () {
                              Get.to(()=> const LoginScreen());
                            }),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
