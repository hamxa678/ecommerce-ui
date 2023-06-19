import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/notification_card_model.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_card_p.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/cutom_title_banner.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/cart/cart_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/category/category_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/category/sub_category.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/producr_details_section/product_details_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/store_screens/store_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel(),
      child: Consumer<CategoryViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
              body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///
                /// Custom App bar
                ///
                _customAppBar(),

                ///
                /// _body function includes:
                /// 1: CustomTabs
                /// 2: Flash Sale Norification Card
                /// 3: Custom Banners
                /// 4: Flash Sale ListView
                /// 5: Just For You ListView
                ///
                _body(model),
              ],
            ),
          )),
        ),
      ),
    );
  }

  Widget _customAppBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 0),
      child: CustomAppBar(
        trailingIcon: SvgPicture.asset(
          '${staticAssetsPath}Home logo.svg',
          height: 32.h,
          width: 32.h,
        ),
        title: Text("Category", style: kHead2),
        leadingFirstIcon: SvgPicture.asset(
          '${staticAssetsPath}options-fill.svg',
          height: 20.h,
          width: 20.h,
          color: blackColor,
        ),
        leadingFirstIconAction: (() {
          Get.to(const StoreScreen());
        }),
        leadingSecondIcon: SvgPicture.asset(
          '${staticAssetsPath}shopping-cart-fill.svg',
          height: 20.h,
          width: 20.h,
          color: blackColor,
        ),
        leadingSecondIconAction: (() {
          Get.to(const CartScreen());
        }),
      ),
    );
  }

  Column _body(CategoryViewModel model) {
    return Column(
      children: [
        ///
        /// CategoryTabs
        ///
        _categoryTabs(model),

        ///
        /// Flash Sale Notification Card
        ///
        _flashSaleNorificationCard(model),

        ///
        /// Flash Sale, custom banner
        ///
        Padding(
            padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 16.h),
            child: CustomBanner(
              underlined: true,
              text: Text(
                'Flash Sales',
                style: kDisplayTitle.copyWith(color: blackColor),
              ),
              leadingWidget: Text(
                'See all',
                style: TextStyle(
                    color: const Color(0xff00D2E0),
                    fontSize: 12.sp,
                    fontFamily: "Poppins-Medium"),
              ),
              leadingAction: (() {
                toastFunction();
              }),
            )),

        ///
        /// Flash Sale, items Horizontal ListView
        ///
        _flashSaleListView(model),

        ///
        /// Just For You, Custom Banner
        ///
        Padding(
          padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 16.h),
          child: CustomBanner(
            underlined: true,
            text: Text(
              'Just For You',
              style: kDisplayTitle.copyWith(color: blackColor),
            ),
            leadingWidget: Text(
              'See all',
              style: TextStyle(
                  color: const Color(0xff00D2E0),
                  fontSize: 12.sp,
                  fontFamily: "Poppins-Medium"),
            ),
            leadingAction: (() {
              toastFunction();
            }),
          ),
        ),

        ///
        /// Just For You, items Horizontal ListView
        ///
        _justForYouListView(model),

        SizedBox(height: (21 + 68).h),
      ],
    );
  }

  Widget _justForYouListView(CategoryViewModel model) {
    return SizedBox(
      height: 158.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.justForYouData.length + 2,
        itemBuilder: ((context, index) {
          return (index == model.justForYouData.length + 1)
              ? SizedBox(width: 20.w)
              : (index == 0)
                  ? SizedBox(width: 4.w)
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => const ProductDetailsScreen());
                      },
                      child: CustomCardP(
                          title: model.justForYouData[index - 1].title,
                          price: model.justForYouData[index - 1].price,
                          discount: model.justForYouData[index - 1].discount,
                          imagePath: model.justForYouData[index - 1].imagePath),
                    );
        }),
      ),
    );
  }

  Widget _flashSaleListView(CategoryViewModel model) {
    return SizedBox(
      height: 158.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.flashSaleData.length + 2,
        itemBuilder: ((context, index) {
          return (index == model.flashSaleData.length + 1)
              ? SizedBox(width: 20.w)
              : (index == 0)
                  ? SizedBox(width: 4.w)
                  : GestureDetector(
                      onTap: () {
                        Get.to(() => const ProductDetailsScreen());
                      },
                      child: CustomCardP(
                          title: model.flashSaleData[index - 1].title,
                          price: model.flashSaleData[index - 1].price,
                          discount: model.flashSaleData[index - 1].discount,
                          imagePath: model.flashSaleData[index - 1].imagePath),
                    );
        }),
      ),
    );
  }

  Widget _flashSaleNorificationCard(CategoryViewModel model) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(16.r)),
        child: SizedBox(
          height: 160.h,
          child: PageView(
            controller: model.controller,
            children: model.notificationCardData.map(
              (NotificationCardModel value) {
                return NotificationCard(
                    title: value.title,
                    description: value.description,
                    time: value.time,
                    imagePath: value.imagePath);
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  Widget _categoryTabs(CategoryViewModel model) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 24.h, 0, 20.h),
      height: 115.h,
      width: double.infinity,
      color: lightGreyColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: model.categoryData.length + 1,
        itemBuilder: (BuildContext context, int index) {
          return (index == 0)
              ? SizedBox(width: 18.w)
              : Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          SubCategoryScreen(
                              title: model.categoryData[index - 1].title),
                        );
                      },
                      child: CategoryCard(
                          title: model.categoryData[index - 1].title,
                          color: model.categoryData[index - 1].color,
                          imagePath: model.categoryData[index - 1].imagePath),
                    ),
                    SizedBox(width: 20.w),
                  ],
                );
        },
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
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      height: 160.h,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover, image: AssetImage(imagePath)),
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
                    style: kHead2.copyWith(color: whiteColor, fontSize: 16.sp),
                  ),
                ),
                SizedBox(height: 8.h),
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
                SvgPicture.asset(imagePath, fit: BoxFit.scaleDown),
              ],
            ),
          ),
          SizedBox(width: 38.w),
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
            child: SvgPicture.asset(imagePath,
                color: color, fit: BoxFit.scaleDown),
          ),
          SizedBox(height: 4.h),
          Expanded(
            child: FittedBox(child: Text(title, style: kBodyS)),
          )
        ],
      ),
    );
  }
}

class PromotionItems extends StatelessWidget {
  const PromotionItems(
      {Key? key,
      required this.title,
      required this.price,
      required this.discount,
      required this.imagePath})
      : super(key: key);
  final String title;
  final String price;
  final String discount;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 16.w),
        Container(
          padding: EdgeInsets.fromLTRB(9.w, 20.h, 8.w, 20.h),
          height: 158.h,
          width: 116.w,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(16.r)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 74.67.w,
                  height: 48.h,
                  child:
                      Image(image: AssetImage(imagePath), fit: BoxFit.contain),
                ),
              ),
              SizedBox(height: 12.h),
              Text(title, style: kBodyS.copyWith(color: blackColor)),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(price, style: kHead4.copyWith(color: primaryColor)),
                  SizedBox(width: 4.h),
                  Text(discount, style: kBodyS),
                ],
              ),
            ],
          ),
        ),
      ],
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
                  child:
                      Image(image: AssetImage(image1), fit: BoxFit.scaleDown),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor,
                  ),
                  child:
                      Image(image: AssetImage(image2), fit: BoxFit.scaleDown),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 0),
                  height: 44.w,
                  width: 44.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    color: lightGreyColor,
                  ),
                  child:
                      Image(image: AssetImage(image3), fit: BoxFit.scaleDown),
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
                  Text(
                    title,
                    style: kLinkOrAction.copyWith(color: primaryColor),
                  ),
                  Text(quantity, style: kSubText.copyWith(color: blackColor))
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
