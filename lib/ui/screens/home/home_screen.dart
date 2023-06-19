import 'package:flutter_antonx_boilerplate/ui/screens/producr_details_section/product_details_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/category_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/notification_card_model.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_card_p.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/cutom_title_banner.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/cart/cart_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/category/sub_category.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/flash_deal/flash_deal_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home/home_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/notification/notification_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/product_search/product_search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              body: SingleChildScrollView(
            child: Stack(
              children: [
                Container(height: 330.h, color: primaryColor),
                Column(
                  children: [
                    /// 
                    /// AppBar
                    /// 
                    _customAppBar(),

                    /// 
                    /// Body
                    /// 
                    _body(model),
                  ],
                )
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 12.h),
      child: Column(
        children: [
          CustomAppBar(
            trailingIcon: SvgPicture.asset(
              '${staticAssetsPath}Home logo.svg',
              height: 32.h,
              width: 32.h,
            ),
            title: Text(
              "Home",
              style: kHead2.copyWith(color: whiteColor),
            ),
            leadingFirstIcon: SvgPicture.asset(
              '${staticAssetsPath}bell-fill.svg',
              height: 20.h,
              width: 20.h,
            ),
            leadingFirstIconAction: (() {
              Get.to(() => const NotificationScreen());
            }),
            leadingSecondIcon: SvgPicture.asset(
              '${staticAssetsPath}shopping-cart-fill.svg',
              color: whiteColor,
              height: 20.h,
              width: 20.h,
            ),
            leadingSecondIconAction: (() {
              Get.to(const CartScreen());
            }),
          ),
          SizedBox(height: 28.h),
        ],
      ),
    );
  }

  Widget _body(HomeViewModel model) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 0.h, 20.w, 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///
              /// Custom Search Product TextField
              ///
              _searchProductsBar(model),

              ///
              /// Product Banner with blue underline
              ///
              _productBanner(),

              ///
              /// Custom Flash Sale Card
              ///
              _flashSaleCardSection(model),

              ///
              /// Categories cards of product
              ///
              _categoryCardOfProduct(model),

              ///
              /// Product Banner with text button having label "See more"
              ///
              _promotionItemsBanner(),
            ],
          ),
        ),

        ///
        /// Custom Promotion List View
        ///
        CustomPromotionListView(model: model),

        ///
        /// You may like section
        ///
        _youMayLikeSection(model),
      ],
    );
  }

  Widget _searchProductsBar(HomeViewModel model) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductSearch());
      },
      child: CustomTextField(
        enable: false,
        controller: model.emailController,
        hintText: 'Search Product',
        prefexIcon: SvgPicture.asset(
          '${staticAssetsPath}search.svg',
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  Widget _productBanner() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          'Product',
          style: kDisplayTitle.copyWith(
            color: secondaryColor,
          ),
        ),
        SizedBox(height: 6.h),
        SvgPicture.asset(
          '${staticAssetsPath}line.svg',
          fit: BoxFit.scaleDown,
        ),
        SizedBox(height: 16.h),
      ],
    );
  }

  Widget _flashSaleCardSection(HomeViewModel model) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(16.r)),
      child: SizedBox(
        height: 160.h,
        child: PageView(
          controller: model.controller,
          children: model.notificationCardData.map(
            (NotificationCardModel value) {
              return GestureDetector(
                onTap: (() => Get.to(const FlashDealScreen())),
                child: NotificationCard(
                    title: value.title,
                    description: value.description,
                    time: value.time,
                    imagePath: value.imagePath),
              );
            },
          ).toList(),
        ),
      ),
    );
  }

  Widget _categoryCardOfProduct(HomeViewModel model) {
    return Column(
      children: [
        SizedBox(height: 32.h),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          height: 158.h,
          child: Wrap(
            spacing: 24.w,
            runSpacing: 16.h,
            children: model.categoryData.map((CategoryModel value) {
              return GestureDetector(
                onTap: (() {
                  Get.to(
                    SubCategoryScreen(title: value.title),
                  );
                }),
                child: CategoryCard(
                  title: value.title,
                  color: value.color,
                  imagePath: value.imagePath,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _promotionItemsBanner() {
    return Column(
      children: [
        SizedBox(height: 28.h),
        CustomBanner(
          text: Text('Promotion Items', style: kHead3),
          leadingWidget: Row(
            children: [
              Text('See more', style: kBodyS),
              SizedBox(width: 4.w),
              SvgPicture.asset(
                '${staticAssetsPath}see more.svg',
              ),
            ],
          ),
          leadingAction: (() {}),
        ),
      ],
    );
  }

  Widget _youMayLikeSection(HomeViewModel model) {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 29.h, 20.w, (26 + 68).h),
      child: Column(
        children: [
          CustomBanner(
            text: Text('You may like', style: kHead3),
            leadingWidget: Row(
              children: [
                Text('See more', style: kBodyS),
                SizedBox(width: 4.w),
                SvgPicture.asset(
                  '${staticAssetsPath}see more.svg',
                ),
              ],
            ),
            leadingAction: (() {}),
          ),
          SizedBox(height: 12.h),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 0),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 160.w / 100.h,
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 16.h),
            itemCount: model.youMayKnowData.length,
            itemBuilder: (context, index) => YouMayLike(
              title: model.youMayKnowData[index].title!,
              quantity: model.youMayKnowData[index].quantity!,
              image1: model.youMayKnowData[index].images!.image1!,
              image2: model.youMayKnowData[index].images!.image2!,
              image3: model.youMayKnowData[index].images!.image3!,
              color: const Color(0xffF6565D),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  const NotificationCard(
      {Key? key,
      required this.title,
      required this.description,
      required this.time,
      required this.imagePath})
      : super(key: key);
  final String title;
  final String description;
  final String time;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        height: 160.h,
        width: double.infinity,
        decoration: BoxDecoration(
          image:
              DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: double.infinity,
              width: 193.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      title,
                      style:
                          kHead2.copyWith(color: whiteColor, fontSize: 16.sp),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  SizedBox(
                    height: 64.h,
                    child: SingleChildScrollView(
                      child: Text(
                        description,
                        style: kBodyM.copyWith(color: whiteColor),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SvgPicture.asset(
                    imagePath,
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 38.w,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              height: 52.h,
              width: 63.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                color: whiteColor,
              ),
              child: Center(
                child: Text(
                  time,
                  textAlign: TextAlign.center,
                  style: kHead4.copyWith(height: 1.3.h),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.title,
      required this.color,
      required this.imagePath})
      : super(key: key);
  final String title;
  final Color color;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60.w,
      height: 71.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 48.h,
            height: 48.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12.r)),
                color: color.withOpacity(0.08)),
            child: SvgPicture.asset(
              imagePath,
              color: color,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          Expanded(
            child: FittedBox(
              child: Text(
                title,
                style: kBodyS,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class YouMayLike extends StatelessWidget {
  const YouMayLike(
      {Key? key,
      required this.title,
      required this.quantity,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.color})
      : super(key: key);
  final String title;
  final String quantity;
  final String image1;
  final String image2;
  final String image3;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 160.w,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8.w, 8.h, 8.w, 48.h),
            height: 100.h,
            width: 160.w,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.all(Radius.circular(16.r))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor,
                  ),
                  child: Image(
                    image: AssetImage(image1),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor,
                  ),
                  child: Image(
                    image: AssetImage(image2),
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor,
                  ),
                  child: Image(
                    image: AssetImage(image3),
                    fit: BoxFit.scaleDown,
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40.h,
              width: 160.w,
              decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r))),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 0),
                child: Column(children: [
                  SizedBox(
                    height: 16.h,
                    child: Text(
                      title,
                      style: kLinkOrAction.copyWith(color: primaryColor),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                    child: Text(
                      quantity,
                      style: kSubText.copyWith(color: blackColor),
                    ),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomPromotionListView extends StatelessWidget {
  const CustomPromotionListView({Key? key, required this.model})
      : super(key: key);
  final HomeViewModel model;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 158.h,
      width: double.infinity,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: model.promotionItemData.length + 3,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return SizedBox(
                width: 20.w,
              );
            } else if (index == 1) {
              return Container(
                padding: EdgeInsets.fromLTRB(16.w, 24.h, 6.w, 24.h),
                height: 158.h,
                width: 116.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    image: const DecorationImage(
                        image: AssetImage('${staticAssetsPath}Group 8844.png'),
                        fit: BoxFit.fill)),
                child: Column(
                  children: [
                    SizedBox(
                      height: 64.h,
                      child: Text(
                        "Promo Product",
                        style: kHead2.copyWith(color: whiteColor),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Expanded(
                      child: Text(
                        'Products are priced from 40%',
                        style: kBodyS.copyWith(color: whiteColor),
                      ),
                    )
                  ],
                ),
              );
            } else if (index == model.promotionItemData.length + 2) {
              return SizedBox(
                width: 20.w,
              );
            } else {
              return InkWell(
                onTap: () {
                  Get.to(() => const ProductDetailsScreen());
                },
                child: CustomCardP(
                    title: model.promotionItemData[index - 2].title,
                    price: model.promotionItemData[index - 2].price,
                    discount: model.promotionItemData[index - 2].discount,
                    imagePath: model.promotionItemData[index - 2].imagePath),
              );
            }
          }),
    );
  }
}
