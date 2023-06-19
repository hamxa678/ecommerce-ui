import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/profile_screen/profile_viewmodel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/strings.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
              padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 0),
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
                  ),
                  SizedBox(height: 22.h),
                  Text('Your Activity', style: kHead3),
                  SizedBox(height: 14.h),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 0),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (context, index) => _notificationCard(model),
                  )
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }
}

Widget _notificationCard(model) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.h),
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r), color: whiteColor),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 40.h,
          width: 40.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: primaryColor.withOpacity(0.08)),
          child: SvgPicture.asset(
            '${staticIconsAssetsPath}gift.svg',
            height: 20.h,
            width: 20.h,
            fit: BoxFit.scaleDown,
            color: primaryColor,
          ),
        ),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order Arrived', style: kHead4),
            SizedBox(height: 8.h),
            SizedBox(
                width: 239.w,
                child: AutoSizeText(
                  'Order 24089794727000824 has been completed & arrived at the destination address ( Please rates your order ) ',
                  style: kBodyS.copyWith(color: blackColor),
                  maxLines: 3,
                )),
            SizedBox(height: 8.h),
            Text('July 20, 2020 (08:00 pm)', style: kSubText)
          ],
        )
      ],
    ),
  );
}
