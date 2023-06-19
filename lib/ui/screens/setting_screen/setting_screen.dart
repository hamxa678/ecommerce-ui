import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/setting_screen/setting_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingViewModel(),
      child: Consumer<SettingViewModel>(
        builder: (context, model, child) => Scaffold(
          backgroundColor: lightGreyColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 24.h),
              child: Column(
                children: [
                  ///
                  /// Header includes Custom App Bar and header image.
                  ///
                  _header(),

                  ///
                  /// Body includes both upper and lower setting containers.
                  ///
                  _upperContainer(model),
                  _lowerContainer(model),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return Column(
      children: [
        CustomAppBar(
          trailingIcon: SvgPicture.asset(
            '${staticAssetsPath}arrow-left.svg',
            fit: BoxFit.scaleDown,
          ),
          trailingIconAction: (() {
            Get.back();
          }),
          title: Text(
            "Settings",
            style: kHead2,
          ),
        ),
        const SizedBox(height: 48),
        Image(
          image: const AssetImage('${staticImagesAssetsPath}S.png'),
          height: 120.h,
          width: 120.w,
          fit: BoxFit.scaleDown,
        ),
      ],
    );
  }

  Widget _upperContainer(SettingViewModel model) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r), color: whiteColor),
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 18.w, 9.h),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              shrinkWrap: true,
              itemCount: model.upperContainerData.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model.upperContainerData[index], style: kHead4),
                      SizedBox(
                        height: 16.h,
                        width: 28.w,
                        child: Transform.scale(
                          transformHitTests: false,
                          scale: .5,
                          child: CupertinoSwitch(
                              value: model.upperContainerSwitchData[index],
                              activeColor: primaryColor,
                              onChanged: (value) {
                                model.toggleUpperSwitch(value, index);
                              }),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            )),
      ],
    );
  }

  Widget _lowerContainer(SettingViewModel model) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r), color: whiteColor),
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 18.w, 9.h),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              shrinkWrap: true,
              itemCount: model.lowerContainerData.length,
              itemBuilder: (context, index) => Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model.lowerContainerData[index], style: kHead4),
                      SizedBox(
                        height: 16.h,
                        width: 28.w,
                        child: Transform.scale(
                          transformHitTests: false,
                          scale: .5,
                          child: CupertinoSwitch(
                              value: model.lowerContainerSwitchData[index],
                              activeColor: primaryColor,
                              onChanged: (value) {
                                model.toggleLowerSwitch(value, index);
                              }),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            )),
      ],
    );
  }
}
