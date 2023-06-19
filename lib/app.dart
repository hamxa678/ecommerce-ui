import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/services/localization_service.dart';

import 'package:flutter_antonx_boilerplate/ui/screens/welcome_screen.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final String title;
  const MyApp({required this.title, Key? key}) : super(key: key);
  static const double _designWidth = 375;
  static const double _designHeight = 812;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(_designWidth, _designHeight),
      builder: (context, widget) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          translations: LocalizationService(),
          locale: const Locale("en"),
          title: title,
          home: //RootScreen(),
              //FlashDealScreen(),
              //SubCategoryDetails(title: 'Headphones')
              //  const CategoryScreen(),
              //const HomeScreen(),
              //ForgetPasswordScreen(),
              //  CartScreen(),
              // StoreScreen()
              WecomeScreen()
          // const SuportScreen(),
          //const SettingScreen(),
          // TermsOfUse()
          // LoginScreen()
          // SignUpScreen(),
          // const PromoScreen()
          // home: const SplashScreen(),
          //RootScreen()
          //ProductDetailsScreen(),
          ),
    );
  }
}
