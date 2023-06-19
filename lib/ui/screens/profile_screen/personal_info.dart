import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/profile_screen/profile_viewmodel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/strings.dart';

class PersonnelInfoPage extends StatelessWidget {
  const PersonnelInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(
                    trailingIcon: SvgPicture.asset(
                      '${staticAssetsPath}arrow-left.svg',
                      height: 20.h,
                      width: 20.h,
                      fit: BoxFit.scaleDown,
                    ),
                    trailingIconAction: () {
                      Get.back();
                    },
                    title: Text(
                      "Personal Info",
                      style: kHead2,
                    ),
                    leadingSecondIcon: SvgPicture.asset(
                      '${staticIconsAssetsPath}edit.svg',
                      height: 20.h,
                      width: 20.h,
                      color: blackColor,
                    ),
                    leadingSecondIconAction: (() {
                      model.toggleEditingModeToTrue();
                    }),
                  ),
                  SizedBox(height: 24.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 32.h, horizontal: 20.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xff8A959E).withOpacity(0.08),
                          blurRadius: 24.r,
                          offset: Offset(0.w, 16.h),
                        )
                      ],
                      color: whiteColor,
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundImage: const AssetImage(
                            '${staticImagesAssetsPath}hamza.jpeg',
                          ),
                          radius: 40.h,
                        ),
                        SizedBox(height: 14.h),
                        Text(
                          'Hamza Khan',
                          style: kHead3,
                        ),
                        SizedBox(height: 16.h),
                        _userDetail(model),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  CustomMainButton(
                      buttonColor: primaryColor,
                      textColor: secondaryColor,
                      onPressed: () {
                        model.toggleEditingModeToFalse();
                      },
                      buttonText: 'Apply')
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

Widget _userDetail(ProfileViewModel model) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nik name',
          style: kBodyM,
        ),
        (model.editingMode == false)
            ? Text(
                'Motu',
                style: kBodyM.copyWith(color: blackColor),
              )
            : CustomTextField(
                height: 45.h,
                hintText: 'Motu',
              ),
        SizedBox(height: 16.h),
        Text(
          'Social network',
          style: kBodyM,
        ),
        Row(
          children: [
            SvgPicture.asset(
              '${staticIconsAssetsPath}google.svg',
              height: 24.h,
              width: 24.h,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 40.w),
            SvgPicture.asset(
              '${staticIconsAssetsPath}twitter.svg',
              height: 24.h,
              width: 24.h,
              fit: BoxFit.scaleDown,
            ),
            SizedBox(width: 40.w),
            SvgPicture.asset(
              '${staticIconsAssetsPath}facebook.svg',
              height: 24.h,
              width: 24.h,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Text(
          'Phone number',
          style: kBodyM,
        ),
        (model.editingMode == false)
            ? Text(
                '+84 87691611',
                style: kBodyM.copyWith(color: blackColor),
              )
            : CustomTextField(
                height: 45.h,
                hintText: '+84 87691611',
              ),
        SizedBox(height: 16.h),
        Text(
          'Email',
          style: kBodyM,
        ),
        (model.editingMode == false)
            ? Text(
                'Motu.uiux@gmail.com',
                style: kBodyM.copyWith(color: blackColor),
              )
            : CustomTextField(
                height: 45.h,
                hintText: 'Motu.uiux@gmail.com',
              ),
        SizedBox(height: 16.h),
        Text(
          'Date of birth',
          style: kBodyM,
        ),
        (model.editingMode == false)
            ? Text(
                '01/ 06/ 1999',
                style: kBodyM.copyWith(color: blackColor),
              )
            : CustomTextField(
                height: 45.h,
                hintText: '01/ 06/ 1999',
              ),
        SizedBox(height: 16.h),
        Text(
          'Sex',
          style: kBodyM,
        ),
        (model.editingMode == false)
            ? Text(
                'Male',
                style: kBodyM.copyWith(color: blackColor),
              )
            : CustomTextField(
                height: 45.h,
                hintText: 'Male',
              ),
      ],
    ),
  );
}
