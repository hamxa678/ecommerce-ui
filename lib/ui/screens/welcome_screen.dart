import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/login/login_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import '../../core/constants/strings.dart';
import '../../core/models/other_models/onboarding.dart';
import '../../core/others/logger_customizations/custom_logger.dart';
// import '../../core/services/auth_service.dart';
import '../../core/services/local_storage_service.dart';
import '../../locator.dart';
import '../custom_widgets/dialogs/network_error_dialog.dart';
import 'onboarding/onboarding_screen.dart';

class WecomeScreen extends StatelessWidget {
  WecomeScreen({Key? key}) : super(key: key);
  // final _authService = locator<AuthService>();
  final _localStorageService = locator<LocalStorageService>();

  static List<Onboarding> onboardingList = [
    Onboarding(
        '${staticAssetsPath}onBoardingScreenImage.png',
        'Genuine product',
        'Diversified items of products in life, genuine product, safe'),
    Onboarding('${staticAssetsPath}onBimage2.png', 'Convenient ordering',
        'Order multiple items from multiple brands at the same time'),
    Onboarding('${staticAssetsPath}onBS2.png', 'Easy search',
        'Find products easy with Scanning camera, pay with just one camera scan'),
    Onboarding('${staticAssetsPath}onBS3.png', 'Super fast delivery',
        'Delivery within the next day including Saturday and Sunday'),
  ];
  final Logger log = CustomLogger(className: 'Splash Screen');

  getStarted() async {
    await _localStorageService.init();

    ///
    /// If not connected to internet, show an alert dialog
    /// to activate the network connection.
    ///
    final connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      Get.dialog(const NetworkErrorDialog());
      return;
    }

    ///
    ///initializing notification services
    ///
    // await NotificationsService().initConfigure();
    // var fcm = await NotificationsService().getFcmToken();
    // print("FCM TOKEN is =====> $fcm");
    // await _notificationService.initConfigure();

    ///getting onboarding data for pre loading purpose
    // onboardingList = await _getOnboardingData();
    /// routing to the last onboarding screen user seen
    if (_localStorageService.onBoardingPageCount + 1 < onboardingList.length ||
        true) {
      // final List<Widget> preCachedImages = [
      //   Image(
      //     image: AssetImage(
      //       onboardingList[_localStorageService.onBoardingPageCount].imgUrl!,
      //     ),
      //     fit: BoxFit.cover,
      //   ),
      //   Image(
      //     image: AssetImage(
      //       onboardingList[_localStorageService.onBoardingPageCount + 1]
      //           .imgUrl!,
      //     ),
      //     fit: BoxFit.cover,
      //   ),
      //   Image(
      //     image: AssetImage(
      //       onboardingList[_localStorageService.onBoardingPageCount + 2]
      //           .imgUrl!,
      //     ),
      //     fit: BoxFit.cover,
      //   ),
      //   Image(
      //     image: AssetImage(
      //       onboardingList[_localStorageService.onBoardingPageCount + 3]
      //           .imgUrl!,
      //     ),
      //     fit: BoxFit.fitWidth,
      //   ),
      // ];

      await Get.to(() => OnboardingScreen(
              currentIndex: 0,
              // _localStorageService.onBoardingPageCount,
              onboardingList: onboardingList,
              preCachedImages: onboardingList
                  .map((e) => Image.asset(e.imgUrl!, fit: BoxFit.contain))
                  .toList())

          // preCachedImages,
          );
      return;
    }
    // await _authService.doSetup();

    // ///
    // ///checking if the user is login or not
    // ///
    // log.d('@_initialSetup. Login State: ${_authService.isLogin}');
    // if (_authService.isLogin) {
    //   //Get.off(() => const RootScreen());
    // } else {
    //   Get.off(() => {});
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(
                height: 283.h,
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  '${staticAssetsPath}Logo.svg',
                  fit: BoxFit.scaleDown,
                ),
              ),
              SizedBox(
                height: 39.h,
              ),
              Text(
                "Welcome to\nEcommerce App",
                textAlign: TextAlign.center,
                style: kHead1,
              ),
              SizedBox(
                height: 118.h,
              ),
              CustomMainButton(
                  buttonText: "GetStart",
                  buttonColor: primaryColor,
                  textColor: secondaryColor,
                  onPressed: () {
                    getStarted();
                  }),
              SizedBox(
                height: 23.h,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => const LoginScreen());
                },
                child: Text(
                  "Already have an account",
                  style: kHead3.copyWith(color: primaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
