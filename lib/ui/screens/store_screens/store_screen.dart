import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_product_typebar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_button1.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/cart/cart_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/product_search/product_search_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/store_screens/store_product_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/store_screens/store_records_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/store_screens/store_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

import '../../../core/constants/strings.dart';
import '../../../core/constants/styles.dart';

import '../../custom_widgets/custom_tabbar_item.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: ChangeNotifierProvider(
        create: (context) => StoreViewModel(),
        child: Consumer<StoreViewModel>(
          builder: (context, model, child) => Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 68.h),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),

                    ///
                    ///Custom App Bar
                    ///
                    child: CustomAppBar(
                      title: Text("Store Pathr", style: kHead2),
                      trailingIcon: SvgPicture.asset(
                        '${staticAssetsPath}arrow-left.svg',
                        fit: BoxFit.cover,
                      ),
                      trailingIconAction: () {
                        Get.back();
                      },
                      leadingFirstIcon: SvgPicture.asset(
                        '${staticAssetsPath}Search1.svg',
                        fit: BoxFit.contain,
                        color: blackColor,
                      ),
                      leadingFirstIconAction: () {
                        Get.to(const ProductSearch());
                      },
                      leadingSecondIcon: SvgPicture.asset(
                        '${staticAssetsPath}shopping-cart-fill.svg',
                        fit: BoxFit.cover,
                        color: blackColor,
                      ),
                      leadingSecondIconAction: () {
                        Get.to(const CartScreen());
                      },
                    ),
                  ),

                  ///
                  ///Store Tab: store detail header on first tab
                  ///
                  model.selectIndex == 0
                      ? _storeDetailHeader(model)
                      : SizedBox(height: 10.h),
                  SizedBox(height: 14.h),
                  TabBar(
                    padding: EdgeInsets.only(left: 20.w),
                    labelPadding: EdgeInsets.fromLTRB(0, 0, 20.w, 4.h),
                    isScrollable: true,
                    labelColor: primaryColor,
                    labelStyle: kDisplayTitle,
                    unselectedLabelStyle: kBodyM,
                    unselectedLabelColor: greyColor,
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                      color: const Color(0xffA1DBF5),
                      width: 3.h,
                    )),
                    indicatorPadding: EdgeInsets.only(right: 75.w),
                    tabs: const <Widget>[
                      Text("Store"),
                      Text("Product"),
                      Text("Collection"),
                      Text("Store records"),
                    ],
                  ),
                  // _customTabbar(model),
                  SizedBox(height: 16.h),
                  model.selectIndex == 0
                      ? _store(model)
                      : model.selectIndex == 1
                          ? StoreProductScreen(model: model)
                          : model.selectIndex == 2
                              ? _colection()
                              : const StoreRecordsScreen()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class StoreInformation extends StatelessWidget {
  Widget icon;
  String number;
  String name;
  StoreInformation(
      {Key? key, required this.icon, required this.name, required this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 76.h,
      width: 48.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 24.h,
            width: 24.w,
            child: icon,
          ),
          FittedBox(
            child: Text(
              number,
              style: kHead3.copyWith(color: whiteColor),
            ),
          ),
          FittedBox(
            child: Text(
              name,
              style: kBodyS.copyWith(color: whiteColor),
            ),
          )
        ],
      ),
    );
  }
}

//
//Tabbar
//
// ignore: unused_element
Widget _customTabbar(StoreViewModel model) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Row(
      children: [
        CustomTabbarItem(
          onTap: () {
            model.updateSelectIndex(0);
          },
          text: "Store",
          selectIndex: model.selectIndex,
          style: kDisplayTitle,
          indexNumber: 0,
          bottomwidth: 22.w,
        ),
        SizedBox(width: 14.w),
        CustomTabbarItem(
          onTap: () {
            model.updateSelectIndex(1);
          },
          text: "Product",
          selectIndex: model.selectIndex,
          style: kDisplayTitle,
          indexNumber: 1,
          bottomwidth: 22.w,
        ),
        SizedBox(width: 14.w),
        CustomTabbarItem(
          onTap: () {
            model.updateSelectIndex(2);
          },
          text: "Colection",
          selectIndex: model.selectIndex,
          style: kDisplayTitle,
          indexNumber: 2,
          bottomwidth: 22.w,
        ),
        SizedBox(width: 14.w),
        CustomTabbarItem(
          onTap: () {
            model.updateSelectIndex(3);
          },
          text: "Store records",
          selectIndex: model.selectIndex,
          style: kDisplayTitle,
          indexNumber: 3,
          bottomwidth: 22.w,
        ),
      ],
    ),
  );
}

Widget _store(StoreViewModel model) {
  return Column(
    children: [
      CustomProductTypeBar(
        productType: "Bestseller",
        leadingIcon: Container(
          height: 32.h,
          width: 32.h,
          margin: EdgeInsets.only(right: 16.w),
          child: SvgPicture.asset(
            '${staticAssetsPath}bestseller.svg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SizedBox(height: 10.h),
      ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 0),
        scrollDirection: Axis.vertical,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            height: 178.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 156.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: whiteColor,
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 80.h,
                          width: 80.w,
                          margin: EdgeInsets.only(left: 20.w, right: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            image: const DecorationImage(
                                image: AssetImage(
                                    '${staticImagesAssetsPath}image11.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                        SizedBox(
                          width: 130.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FittedBox(
                                child: Text(
                                  'Jordan 1 Union Los',
                                  style:
                                      kDisplayTitle.copyWith(color: blackColor),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  'Angeles Black',
                                  style:
                                      kDisplayTitle.copyWith(color: blackColor),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    '${staticAssetsPath}Star.svg',
                                    height: 16.h,
                                    width: 16.w,
                                    color: tertiaryColorYellow,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '4.7',
                                    style: kBodyS.copyWith(color: blackColor),
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    '(5.6k rating)',
                                    style: kBodyS,
                                  )
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    '${staticAssetsPath}shopping-cart-fill.svg',
                                    height: 16.h,
                                    width: 16.w,
                                    color: tertiaryColorRed,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    "700k sales",
                                    style: kBodyS.copyWith(color: blackColor),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4.h),
                              Row(
                                children: [
                                  Text(
                                    "\$275.00",
                                    style: kHead3.copyWith(color: primaryColor),
                                  ),
                                  SizedBox(width: 6.w),
                                  Text(
                                    "-59%",
                                    style: kBodyS,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 16.w,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SvgPicture.asset(
                        '${staticAssetsPath}bookmark-fill.svg',
                        height: 48.h,
                        width: 48.w,
                        color: model.colors[Random().nextInt(3)],
                        fit: BoxFit.cover,
                      ),
                      Text(
                        '${index + 1}',
                        style: kHead4.copyWith(color: whiteColor),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      )
    ],
  );
}

Widget _colection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SizedBox(
        height: 188.h,
      ),
      SizedBox(
        height: 158.h,
        width: 158.w,
        child: Image.asset(
          '${staticAssetsPath}collection.png',
          fit: BoxFit.contain,
        ),
      ),
      Text(
        'There is no collection',
        style: kBodyL,
      )
    ],
  );
}

Widget _storeDetailHeader(model) {
  return SizedBox(
    height: 246.h,
    width: double.maxFinite,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Container(
            height: 246.h,
            width: double.maxFinite,
            margin: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: const DecorationImage(
                  image: AssetImage(
                      '${staticImagesAssetsPath}store-background.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(children: [
              SizedBox(height: 20.h),
              Container(
                height: 80.h,
                width: 80.w,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('${staticAssetsPath}store-logo.png'),
                      fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StoreInformation(
                      icon: SvgPicture.asset(
                        '${staticAssetsPath}bookmark-fill.svg',
                        fit: BoxFit.contain,
                      ),
                      name: 'Follower',
                      number: '247k'),
                  SizedBox(width: 32.w),
                  StoreInformation(
                      icon: SvgPicture.asset(
                        '${staticAssetsPath}cube-fill.svg',
                        fit: BoxFit.contain,
                      ),
                      name: 'Product',
                      number: '4.5k'),
                  SizedBox(width: 32.w),
                  StoreInformation(
                      icon: SvgPicture.asset(
                        '${staticAssetsPath}star-fill.svg',
                        fit: BoxFit.contain,
                        color: linkAndActionColor,
                      ),
                      name: 'Reviews',
                      number: '1.5k'),
                ],
              ),
            ]),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: CustomTextButton1(
              onTap: () {},
              color: whiteColor,
              text: 'Add to favorites',
              style: kLinkOrAction.copyWith(color: primaryColor),
              height: 32.h,
              width: 146.w,
              radius: 8.r),
        ),
      ],
    ),
  );
}
