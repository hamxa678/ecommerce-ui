// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/flash_deal/flash_deal_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/models/big_card_model.dart';

class FlashDealScreen extends StatelessWidget {
  const FlashDealScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FlashDealViewModel(),
      child: Consumer<FlashDealViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: lightGreyColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 21.h),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomAppBar(
                            trailingIcon: SvgPicture.asset(
                              '${staticAssetsPath}arrow-left.svg',
                              fit: BoxFit.scaleDown,
                              height: 20.h,
                              width: 20.w,
                            ),
                            trailingIconAction: () {
                              Get.back();
                            },
                            title: Text(
                              "Flash Deal",
                              style: kHead2,
                            ),
                            leadingFirstIcon: SvgPicture.asset(
                              '${staticAssetsPath}flash-fill.svg',
                              fit: BoxFit.scaleDown,
                              color: blackColor,
                            ),
                            leadingSecondIcon: SvgPicture.asset(
                              '${staticAssetsPath}question-mark-circle-fill.svg',
                              fit: BoxFit.scaleDown,
                              color: blackColor,
                            ),
                          ),
                          SizedBox(height: 31.h),
                          Container(
                            padding:
                                EdgeInsets.fromLTRB(20.w, 20.h, 24.w, 20.h),
                            height: 92.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16.r)),
                              image: const DecorationImage(
                                  image: AssetImage(
                                      "${staticAssetsPath}FDBimage.png"),
                                  fit: BoxFit.cover),
                            ),
                            child: Row(children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FLASH SALE 12',
                                      style: kHead2.copyWith(color: whiteColor),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'Stay tune and check your notif everyday',
                                      style:
                                          kSubText.copyWith(color: whiteColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 6.h),
                                height: 52.h,
                                width: 63.w,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.r)),
                                  color: whiteColor,
                                ),
                                child: Center(
                                  child: Text(
                                    '24 hours',
                                    textAlign: TextAlign.center,
                                    style: kHead4.copyWith(height: 1.3.h),
                                  ),
                                ),
                              ),
                            ]),
                          ),
                        ]),
                  ),
                  SizedBox(
                      height: 88.h,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.flashDealsTimesData.length + 2,
                          itemBuilder: ((context, index) {
                            return (index == 0)
                                ? SizedBox(
                                    width: 20.w,
                                  )
                                : (index ==
                                        model.flashDealsTimesData.length + 1)
                                    ? SizedBox(
                                        width: 4.w,
                                      )
                                    : Card1(
                                        index: index - 1,
                                        time: model
                                            .flashDealsTimesData[index - 1]
                                            .time,
                                        title: model
                                            .flashDealsTimesData[index - 1]
                                            .title,
                                      );
                          }))),
                  SizedBox(height: 32.h),
                  SizedBox(
                      height: 56.h,
                      width: double.infinity,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: model.brandsData.length + 3,
                          itemBuilder: ((context, index) {
                            return (index == 0)
                                ? SizedBox(
                                    width: 20.w,
                                  )
                                : (index == model.brandsData.length + 2)
                                    ? SizedBox(
                                        width: 4.w,
                                      )
                                    : (index == 1)
                                        ? Card2(image: null, index: index)
                                        : Card2(
                                            image: model
                                                .brandsData[index - 2].image,
                                            index: null);
                          }))),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 0),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 24.h),
                          height: 68.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.r)),
                            color: whiteColor.withOpacity(0.6),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                '${staticAssetsPath}funnel-fill.svg',
                                fit: BoxFit.scaleDown,
                                color: greyColor,
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'Filter',
                                style: kHead3.copyWith(height: 1.3),
                              ),
                              SizedBox(
                                width: 8.w,
                              ),
                              Text(
                                'All Products',
                                style: kBodyM,
                              ),
                              const Spacer(),
                              Text(
                                '233 Results',
                                style: kBodyM,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        Wrap(
                            spacing: 15.w,
                            runSpacing: 16.h,
                            children: model.bigCardData.map((BigCard value) {
                              return CustomBigCard(
                                  image: value.image!,
                                  title: value.title!,
                                  newPrice: value.newPrice!,
                                  discount: value.discount!,
                                  productSold: value.productSold!,
                                  totalProduct: value.totalProduct!);
                            }).toList()),
                        SizedBox(
                          height: 20.h,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1(
      {Key? key, required this.time, required this.title, required this.index})
      : super(key: key);
  final time;
  final title;
  final index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 88.h,
          width: 88.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              color: (index == 0) ? greyColor : whiteColor),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  time,
                  style: kHead2.copyWith(
                      color: (index == 0)
                          ? whiteColor
                          : (index == 1)
                              ? primaryColor
                              : blackColor),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  title,
                  style: kBodyS.copyWith(
                      color: (index == 0)
                          ? whiteColor
                          : (index == 1)
                              ? primaryColor
                              : blackColor),
                ),
              ]),
        ),
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({Key? key, required this.image, required this.index})
      : super(key: key);
  final image;
  final index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 88.h,
            padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 20.h),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
                color: whiteColor),
            child: Center(
                child: (index == 1)
                    ? Text(
                        "All",
                        style: kHead3.copyWith(color: primaryColor, height: 1),
                      )
                    : Image(
                        image: AssetImage(image),
                        fit: BoxFit.scaleDown,
                      ))),
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }
}

class CustomBigCard extends StatelessWidget {
  const CustomBigCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.newPrice,
      required this.discount,
      required this.productSold,
      required this.totalProduct})
      : super(key: key);
  final String image;
  final String title;
  final String newPrice;
  final String discount;
  final String totalProduct;
  final String productSold;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 20.h, 20.w, 20.h),
      height: 248.h,
      width: 160.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        color: whiteColor,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: Image(
                height: 80.h,
                width: 94.12.w,
                fit: BoxFit.scaleDown,
                image: AssetImage(image),
              ),
            ),
            SizedBox(
              height: 40.h,
              child: Text(
                title,
                style: kHead4,
              ),
            ),
            SizedBox(
              height: 24.h,
              child: Row(
                children: [
                  Text(
                    newPrice,
                    style: kHead3.copyWith(color: primaryColor),
                  ),
                  Text(discount, style: kSubText),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: Container(
                height: 12.h,
                width: 128.w,
                color: lightGreyColor,
                child: Stack(
                  children: [
                    Container(
                      height: 12.h,
                      width: 80.w,
                      color: tertiaryColorRed,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
              child: Text(
                '$productSold/$totalProduct product sold',
                style: kBodyS,
              ),
            )
          ]),
    );
  }
}
