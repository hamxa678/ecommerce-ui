import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/root/root_screen_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootScreenViewModel(),
      child: Consumer<RootScreenViewModel>(
        builder: (context, model, child) => WillPopScope(
          onWillPop: () async {
            final status = await Get.dialog(AlertDialog(
              title: Text(
                'Caution!',
                style: kHead2,
              ),
              content: Text(
                'Do you really want to close the application?',
                style: kBodyL,
              ),
              actions: [
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text(
                    'Yes',
                    style: kHead3.copyWith(color: secondaryColor),
                  ),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: primaryColor),
                  onPressed: () {
                    Get.back(result: false);
                  },
                  child: Text(
                    'No',
                    style: kHead3.copyWith(color: secondaryColor),
                  ),
                ),
              ],
            ));

            /// In case user has chosen not to be kept logged in,
            /// he will get logged out of the app on exit.
            // if (status && !locator<AuthService>().isRememberMe) {
            //   await locator<AuthService>().logout();
            // }
            return status;
          },
          child: Scaffold(
            extendBody: true,
            body: model.allScreen[model.selectedScreen],

            bottomNavigationBar: model.isEnableBottomBar
                ? SizedBox(
                    height: 68.h,
                    child: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      unselectedLabelStyle: kBodyS,
                      selectedLabelStyle: kLinkOrAction,
                      showUnselectedLabels: true,
                      backgroundColor: whiteColor,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          backgroundColor: whiteColor,
                          icon: SvgPicture.asset(
                            '${staticIconsAssetsPath}cube.svg',
                            height: 24.h,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                            color: (model.selectedScreen == 0)
                                ? primaryColor
                                : greyColor,
                          ),
                          label: 'Home',
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: whiteColor,
                          icon: SvgPicture.asset(
                            '${staticIconsAssetsPath}globe.svg',
                            height: 24.h,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                            color: (model.selectedScreen == 1)
                                ? primaryColor
                                : greyColor,
                          ),
                          label: 'Category',
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: whiteColor,
                          icon: SvgPicture.asset(
                            '${staticIconsAssetsPath}gift.svg',
                            height: 24.h,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                            color: (model.selectedScreen == 2)
                                ? primaryColor
                                : greyColor,
                          ),
                          label: 'Promo',
                        ),
                        BottomNavigationBarItem(
                          backgroundColor: whiteColor,
                          icon: SvgPicture.asset(
                            '${staticIconsAssetsPath}person.svg',
                            height: 24.h,
                            width: 24.w,
                            fit: BoxFit.scaleDown,
                            color: (model.selectedScreen == 3)
                                ? primaryColor
                                : greyColor,
                          ),
                          label: 'Profile',
                        ),
                      ],
                      currentIndex: model.selectedScreen,
                      selectedItemColor: primaryColor,
                      unselectedItemColor: greyColor,
                      onTap: model.updatedScreenIndex,
                    ),
                  )
                : Container(),
            //      body: _list[_page],
          ),
        ),
      ),
    );
  }
}
