import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/cutom_title_banner.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/product_search/product_search_viewmodel.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/strings.dart';
import '../../../core/models/featured_card_model.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductSearchModel(),
      child: Consumer<ProductSearchModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              (model.pageRoute == false)
                                  ? Get.back()
                                  : model.togglePageRoute();
                            },
                            child: SvgPicture.asset(
                              '${staticAssetsPath}arrow-left.svg',
                              height: 32.h,
                              width: 32.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Expanded(
                            child: Text(
                              "Search",
                              style: kHead2,
                            ),
                          ),
                          (model.pageRoute == false)
                              ? SvgPicture.asset(
                                  '${staticAssetsPath}funnel-fill.svg',
                                  fit: BoxFit.scaleDown,
                                  color: blackColor,
                                )
                              : const SizedBox(),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      CustomTextField(
                        controller: model.searchController,
                        onTap: () {
                          (model.pageRoute == false)
                              ? model.togglePageRoute()
                              : null;
                        },
                        textFieldColor: whiteColor,
                        hintText: 'Search Product',
                        prefexIcon: SvgPicture.asset(
                          '${staticAssetsPath}Search-Grey.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                    ],
                  ),
                ),
                (model.pageRoute == false)
                    ? const ProductSearchScreen1()
                    : _productSearchScreen2(model),
                // : const ProductSearchScreen2(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}

_productSearchScreen2(model) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Resent Search',
          style: kHead3,
        ),
        SizedBox(
          height: 12.h,
        ),
        SizedBox(
          height: 615.h,
          child: ListView.builder(
              itemCount: model.recentSearchData.length,
              itemBuilder: ((context, index) => GestureDetector(
                    onTap: () {
                      model.toggleRecent(model.recentSearchData[index]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.h, vertical: 0),
                      height: 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(16.r))),
                      child: Row(
                        children: [
                          Text(
                            model.recentSearchData[index],
                            style: kHead4,
                          ),
                          const Spacer(),
                          SvgPicture.asset(
                            '${staticAssetsPath}diagonal-arrow-right-up.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                    ),
                  ))),
        )
      ],
    ),
  );
}

class ProductSearchScreen1 extends StatelessWidget {
  const ProductSearchScreen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProductSearchModel(),
        child: Consumer<ProductSearchModel>(
            builder: (context, model, child) => ModalProgressHUD(
                  inAsyncCall: model.state == ViewState.busy,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
                        child: Column(children: [
                          /// featured card
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24.r)),
                              child: SizedBox(
                                  height: 280.h,
                                  child: PageView(
                                      controller: model.controller,
                                      children: model.featuredCardData
                                          .map((FeaturedCardModel value) {
                                        return FeaturedCard(
                                          backGroundPath:
                                              value.backGroundImage!,
                                          title: value.title!,
                                          image1Path: value.images!.image1!,
                                          image2Path: value.images!.image2!,
                                          image3Path: value.images!.image3!,
                                        );
                                      }).toList()))),
                          SizedBox(
                            height: 43.h,
                          ),

                          ///Top key search
                          CustomBanner(
                            text: Text(
                              'Top Key Search',
                              style: kHead3,
                            ),
                            leadingWidget: Row(
                              children: [
                                Text(
                                  'See more',
                                  style: kBodyS,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                SvgPicture.asset(
                                  '${staticAssetsPath}see more.svg',
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 12.h,
                          ),
                        ]),
                      ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(top: 0),
                          itemCount: model.topKeySearchData.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  width: double.infinity,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16.r)),
                                    color: whiteColor,
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 44.h,
                                        width: 44.h,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r)),
                                          child: Image(
                                              image: AssetImage(model
                                                  .topKeySearchData[index]
                                                  .images!)),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16.w,
                                      ),
                                      Expanded(
                                          child: Text(
                                        model.topKeySearchData[index].title!,
                                        style: kHead3,
                                      )),
                                      Text(
                                        model.topKeySearchData[index].quantity!,
                                        style: kBodyM,
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      SvgPicture.asset(
                                        '${staticAssetsPath}diagonal-arrow-right-up.svg',
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                )
                              ],
                            );
                          }),

                      /// Suggested to you
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 20.w),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Suggest to you ',
                                style: kHead3,
                              ),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )));
  }
}

class FeaturedCard extends StatelessWidget {
  const FeaturedCard(
      {Key? key,
      required this.title,
      required this.backGroundPath,
      required this.image1Path,
      required this.image2Path,
      required this.image3Path})
      : super(key: key);
  final String title;
  final String backGroundPath;
  final String image1Path;
  final String image2Path;
  final String image3Path;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backGroundPath), fit: BoxFit.cover),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured',
              style: kHead3.copyWith(color: whiteColor),
            ),
            SizedBox(
              width: 233.w,
              child: Text(
                title,
                style: kHead1.copyWith(color: whiteColor, height: 1.65.h),
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              height: 40.h,
              width: 160.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: blackColor.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 32.h,
                    width: 32.h,
                    child: Image(
                      image: AssetImage(image1Path),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                    width: 32.h,
                    child: Image(
                      image: AssetImage(image2Path),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                    width: 32.h,
                    child: Image(
                      image: AssetImage(image3Path),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
