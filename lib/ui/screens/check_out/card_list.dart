import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/debit_card_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/other_models/dummy_card_data.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/check_out_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/payment_method_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'dart:math';

// ignore: must_be_immutable
class CardList extends StatelessWidget {
  CardList({Key? key}) : super(key: key);
  Random random = Random();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckOutViewModel(context),
      child: Consumer<CheckOutViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: lightGreyColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 69.h, 20.w, 0),
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
                      trailingIconAction: (() {
                        Get.back(result: selectedCardIndex);
                      }),
                      title: Text(
                        "List Cards",
                        style: kHead2,
                      ),
                      leadingSecondIconAction: (() {
                        model.addNewCard(context, model);
                      }),
                      leadingSecondIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}add-fill.svg',
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Text(
                      'Tap on the card to set as default payment method',
                      style: kBodyM,
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Text(
                      'Swipe right to remove card',
                      style: kBodyM,
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      // itemCount: model.debitCardDetailData.length,
                      itemCount: model.debitCardDetailVMData.length,
                      itemBuilder: (context, index) => Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              selectedCardIndex = index;
                              Get.back(result: index);
                            },
                            child: DebitCard(
                                accountNumber: '**** **** **** 2345',
                                ownerName:
                                    model.debitCardDetailVMData[index]!.name!,
                                imageURL: model.debitCardImage[random
                                    .nextInt(model.debitCardImage.length)]),
                          ),
                          SizedBox(
                            height: 15.h,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget modalBottomSheet(
  BuildContext context,
  CheckOutViewModel model,
) {
  return SizedBox(
    height: (519 + 22 - 34).h,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: (519 - 34).h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 54.h, 20.w, 32.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Chosse card payment',
                    style: kHead2,
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomTextField(
                    controller: model.addCardNameController,
                    hintText: 'Name',
                    prefexIcon: SvgPicture.asset(
                      '${staticAssetsPath}person-fill.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    controller: model.addCardPhoneNoController,
                    hintText: 'Phone',
                    prefexIcon: SvgPicture.asset(
                      '${staticAssetsPath}phone-fill.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    controller: model.addCardEmailController,
                    hintText: 'Email',
                    prefexIcon: SvgPicture.asset(
                      '${staticAssetsPath}Message.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextField(
                    controller: model.addCardCardNoController,
                    hintText: 'Card Number',
                    prefexIcon: SvgPicture.asset(
                      '${staticIconsAssetsPath}credit-card-fill.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  const Spacer(),
                  CustomMainButton(
                      buttonColor: primaryColor,
                      textColor: secondaryColor,
                      onPressed: () {
                        debitCardDetailData.add(DebitCardDetail(
                            name: model.addCardNameController.text,
                            phoneNo:
                                int.parse(model.addCardPhoneNoController.text),
                            email: model.addCardEmailController.text,
                            cardNo:
                                int.parse(model.addCardCardNoController.text)));
                        Get.back(
                            result: DebitCardDetail(
                                name: model.addCardNameController.text,
                                phoneNo: int.parse(
                                    model.addCardPhoneNoController.text),
                                email: model.addCardEmailController.text,
                                cardNo: int.parse(
                                    model.addCardCardNoController.text)));
                      },
                      buttonText: 'Add New Card'),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 25.w,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              height: 44.w,
              width: 44.w,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: blackColor.withOpacity(0.1),
                      blurRadius: 20.r,
                      spreadRadius: 0,
                      offset: const Offset(0, 10),
                    )
                  ],
                  color: whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(12.r))),
              child: SvgPicture.asset(
                '${staticAssetsPath}close.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
