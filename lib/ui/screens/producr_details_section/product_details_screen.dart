import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_button1.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/producr_details_section/product_details_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/producr_details_section/reviews_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../../core/constants/strings.dart';
import '../../../core/constants/styles.dart';
import '../../custom_widgets/button/custom_main_button.dart';
import '../../custom_widgets/custom_add_button.dart';
import '../../custom_widgets/custom_app_bar_1.dart';
import '../../custom_widgets/custom_bottom_button.dart';
import '../../custom_widgets/custom_product_typebar.dart';
import '../../custom_widgets/custom_tabbar_item.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsViewModel(),
      child: Consumer<ProductDetailsViewModel>(
        builder: (context, model, child) => Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 69.h),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w),
                  child: CustomAppBar1(
                    leadingIcon: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        '${staticAssetsPath}arrow-left.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                    title: Text("Product Detail", style: kHead2),
                    trelingIcon1: SvgPicture.asset(
                      '${staticAssetsPath}share-fill.svg',
                      fit: BoxFit.scaleDown,
                    ),
                    trelingIcon2: SvgPicture.asset(
                      '${staticAssetsPath}shopping-cart-fill.svg',
                      fit: BoxFit.scaleDown,
                      color: blackColor,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                _customTabbar(model),
                SizedBox(height: 9.h),
                model.selectIndex == 0
                    ? _overviewProduct(model, context)
                    : _detailsDescriptionProduct(model, context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
//Tabbar
//
Widget _customTabbar(ProductDetailsViewModel model) {
  return Padding(
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: Row(
      children: [
        CustomTabbarItem(
          onTap: () {
            model.updateSelectIndex(0);
          },
          text: "Overview",
          selectIndex: model.selectIndex,
          style: kDisplayTitle,
          indexNumber: 0,
          bottomwidth: 32.w,
        ),
        SizedBox(width: 23.w),
        CustomTabbarItem(
          onTap: () {
            model.updateSelectIndex(1);
          },
          text: "Details Description",
          selectIndex: model.selectIndex,
          style: kDisplayTitle,
          indexNumber: 1,
          bottomwidth: 32.w,
        ),
      ],
    ),
  );
}

//
//Product Overview
//
Column _overviewProduct(ProductDetailsViewModel model, BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w),
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: GestureDetector(
                  onTap: () {
                    model.productControler.previousPage();
                    model.updateSelectSideArrow(1);
                  },
                  child: SvgPicture.asset(
                    '${staticAssetsPath}Arrow - Left 2.svg',
                    fit: BoxFit.cover,
                    color: model.selectSideArrow == 0 ? greyColor : blackColor,
                  ),
                ),
              ),
              SizedBox(width: 47.w),
              SizedBox(
                height: 196.h,
                width: 192.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      child: SizedBox(
                        height: 180.h,
                        width: 180.w,
                        child: CarouselSlider.builder(
                          carouselController: model.productControler,
                          itemCount: model.dummyProducts.length,
                          options: CarouselOptions(
                            initialPage: 0,
                            viewportFraction: 1,
                          ),
                          itemBuilder: ((context, index, realIndex) {
                            final urlImage =
                                model.dummyProducts[index].productImage;
                            model.productIndex = model.dummyProducts[index].id!;
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                image: DecorationImage(
                                    image: AssetImage(urlImage!),
                                    fit: BoxFit.cover),
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    model.dummyProducts.length == 1
                        ? Container()
                        : Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 32.h,
                              width: 192.w,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: model.dummyProducts.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTap: () =>
                                        model.updateProductIndex(index),
                                    child: Container(
                                      height: 32.h,
                                      width: 32.w,
                                      margin: const EdgeInsets.only(right: 8),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(model
                                                .dummyProducts[index]
                                                .productImage
                                                .toString()),
                                            fit: BoxFit.cover),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              SizedBox(width: 47.w),
              SizedBox(
                height: 24.h,
                width: 24.w,
                child: GestureDetector(
                  onTap: () {
                    model.productControler.nextPage();
                    model.updateSelectSideArrow(0);
                  },
                  child: SvgPicture.asset(
                    '${staticAssetsPath}arrow-ios-right.svg',
                    fit: BoxFit.cover,
                    color: model.selectSideArrow == 0 ? blackColor : greyColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildIndicator(model),
          SizedBox(height: 32.h),
          model.dummyProducts.length == 1 ? Container() : _timerButton(),
          SizedBox(height: 16.h),
          _productDetail(model),
        ]),
      ),
      SizedBox(height: 32.h),
      _bottomProducts(model, context),
    ],
  );
}

Row _buildIndicator(ProductDetailsViewModel model) {
  return Row(
    children: [
      SizedBox(width: 120.w),
      model.dummyProducts.length == 1
          ? Container()
          : SizedBox(
              height: 16.h,
              width: 112.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.dummyProducts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      model.updateProductIndex(index);
                    },
                    child: Container(
                      height: 16.h,
                      width: 16.w,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: model.dummyProducts[index].color,
                      ),
                    ),
                  );
                },
              ),
            ),
      const Spacer(),
      Container(
        height: 24.h,
        width: 60.w,
        margin: EdgeInsets.only(right: 5.w),
        child: Text(
          '${model.productIndex + 1}/${model.dummyProducts.length}',
          style: kBodyL,
        ),
      )
    ],
  );
}

Widget _timerButton() {
  return Container(
    height: 56.h,
    width: 302.h,
    margin: EdgeInsets.only(left: 29.w, right: 44.w),
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      color: tertiaryColorRed,
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
        height: 24.h,
        width: 24.w,
        child: SvgPicture.asset(
          '${staticAssetsPath}timer-fill.svg',
          fit: BoxFit.cover,
        ),
      ),
      Text(
        '1 Day : 2 Hour : 49 Minute',
        style: kHead3.copyWith(color: whiteColor),
      )
    ]),
  );
}

Widget _productDetail(ProductDetailsViewModel model) {
  return Container(
    height: 90.h,
    width: 334.w,
    alignment: Alignment.center,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ignore: avoid_print
        Row(
          children: [
            Text(
              '${model.dummyProducts[model.productIndex].name}',
              style: kHead2,
            ),
            const Spacer(),
            SizedBox(
              height: 40.h,
              width: 40.w,
              child: SvgPicture.asset(
                '${staticAssetsPath}Group 332.svg',
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
        SizedBox(
          height: 19.h,
          child: Text(
            'SKU: ${model.dummyProducts[model.productIndex].id}',
            style: kBodyL.copyWith(color: blackColor),
          ),
        ),
        SizedBox(
          height: 31.h,
          child: Row(
            children: [
              Text(
                'Available Stock ${model.dummyProducts[model.productIndex].stock}',
                style: kBodyS,
              ),
              const Spacer(),
              Text(
                '\$${model.dummyProducts[model.productIndex].price}',
                style: kHead2.copyWith(color: primaryColor),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

//
//More product show like intrested, view product
//
//
Widget _bottomProducts(ProductDetailsViewModel model, BuildContext context) {
  return Container(
    color: lightGreyColor,
    child: model.dummyProducts.length == 1
        ? Column(
            children: [
              CustomProductTypeBar(
                productType: 'Maybe Interested',
                seeMore: 'See more',
                trelingIcon: SvgPicture.asset(
                  '${staticAssetsPath}arrow-ios-right.svg',
                  fit: BoxFit.cover,
                  color: greyColor,
                ),
              ),
              SizedBox(height: 14.h),
              _intrestedProducts(model),
              SizedBox(height: 16.h),
              Container(
                height: 96.h,
                width: 375.w,
                color: whiteColor,
                child: CustomBottomButton(
                    name: "Add to Cart",
                    onTap: () {
                      customBottomSheet(context, model);
                    }),
              ),
            ],
          )
        : Column(
            children: [
              CustomProductTypeBar(
                productType: 'Maybe Interested',
                seeMore: 'See more',
                trelingIcon: SvgPicture.asset(
                  '${staticAssetsPath}arrow-ios-right.svg',
                  fit: BoxFit.cover,
                  color: greyColor,
                ),
              ),
              SizedBox(height: 14.h),
              _intrestedProducts(model),
              SizedBox(height: 32.h),
              CustomProductTypeBar(
                productType: 'Usually Bought Together',
                seeMore: 'See more',
                trelingIcon: SvgPicture.asset(
                  '${staticAssetsPath}arrow-ios-right.svg',
                  fit: BoxFit.cover,
                  color: greyColor,
                ),
              ),
              SizedBox(height: 12.h),
              _usuallyBoughtTogetherProducts(model),
              SizedBox(height: 32.h),
              CustomProductTypeBar(
                productType: 'Info Store',
              ),
              SizedBox(height: 12.h),
              _infoStore(model),
              SizedBox(height: 32.h),
              CustomProductTypeBar(
                productType: 'Viewed Products',
              ),
              SizedBox(height: 12.h),
              _viewedProducts(model),
              SizedBox(height: 16.h),
              Container(
                height: 96.h,
                width: 375.w,
                color: whiteColor,
                child: CustomBottomButton(
                    name: "Add to Cart",
                    onTap: () {
                      customBottomSheet(context, model);
                    }),
              ),
            ],
          ),
  );
}

Widget _intrestedProducts(ProductDetailsViewModel model) {
  return Container(
    height: 158.h,
    width: double.infinity,
    padding: EdgeInsets.only(left: 20.w),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: model.dummyInterestedProduct.length,
      itemBuilder: ((context, index) {
        return Container(
          padding: EdgeInsets.fromLTRB(9.w, 20.h, 8.w, 20.h),
          margin: EdgeInsets.only(right: 16.w),
          height: 158.h,
          width: 116.w,
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 46.w,
                  height: 46.h,
                  child: Image(
                    image: AssetImage(model
                        .dummyInterestedProduct[index].productImage
                        .toString()),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '${model.dummyInterestedProduct[index].name}',
                style: kBodyS.copyWith(color: blackColor),
              ),
              SizedBox(height: 4.h),
              Row(
                children: [
                  Text(
                    '\$${model.dummyInterestedProduct[index].price}',
                    style: kHead4.copyWith(color: primaryColor),
                  ),
                  SizedBox(width: 4.h),
                  Text('-${model.dummyInterestedProduct[index].discount}%',
                      style: kBodyS),
                ],
              ),
            ],
          ),
        );
      }),
    ),
  );
}

Widget _usuallyBoughtTogetherProducts(ProductDetailsViewModel model) {
  return Container(
    height: 160.h,
    width: 335.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: whiteColor,
    ),
    child: Column(
      children: [
        SizedBox(height: 22.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 23.5.w),
            _BoughtTogether(
                productImage: '${staticImagesAssetsPath}group_838.png',
                price: '${model.dummyInterestedProduct[0].price}'),
            SizedBox(width: 12.w),
            const AddSign(),
            SizedBox(width: 12.w),
            _BoughtTogether(
                productImage: '${staticImagesAssetsPath}group_837.png',
                price: '${model.dummyInterestedProduct[0].price}'),
            SizedBox(width: 12.w),
            const AddSign(),
            SizedBox(width: 12.w),
            _BoughtTogether(
                productImage: '${staticImagesAssetsPath}group_839.png',
                price: '${model.dummyInterestedProduct[0].price}'),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          "Buy 3 reduce product, reduce 30%",
          style: kBodyS,
        )
      ],
    ),
  );
}

class AddSign extends StatelessWidget {
  const AddSign({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 25.h),
      height: 72.h,
      width: 16.w,
      child: SvgPicture.asset(
        '${staticAssetsPath}plus.svg',
        fit: BoxFit.contain,
        color: greyColor,
      ),
    );
  }
}

// ignore: must_be_immutable
class _BoughtTogether extends StatelessWidget {
  String productImage;
  String price;
  _BoughtTogether({Key? key, required this.productImage, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 72,
          width: 72,
          child: Image(
            image: AssetImage(productImage),
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          height: 17.h,
          width: 44.w,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Text(
              '\$$price',
              style: kHead4.copyWith(color: primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _infoStore(ProductDetailsViewModel model) {
  return Container(
    height: 88.h,
    width: 335.w,
    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: whiteColor,
    ),
    child: Row(
      children: [
        Container(
          height: 48.h,
          width: 48.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            image: const DecorationImage(
              image: AssetImage('${staticAssetsPath}Ellipse_36.png'),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "Store Pathr",
              style: kHead3.copyWith(color: primaryColor),
            ),
            Text(
              '3456k follower',
              style: kBodyS,
            ),
          ],
        ),
        const Spacer(),
        SizedBox(
          width: 97.w,
          height: 32.h,
          child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(lightGreyColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
              ),
              child: Text(
                'Follow',
                textAlign: TextAlign.center,
                style: kHead4.copyWith(color: primaryColor, height: 1.1),
              )),
        )
      ],
    ),
  );
}

Widget _viewedProducts(ProductDetailsViewModel model) {
  return Container(
    width: double.infinity,
    height: 136.h,
    padding: EdgeInsets.only(left: 20.w, right: 20.w),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: model.dummyViewedProduct.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 136.h,
          width: 116.w,
          padding: EdgeInsets.only(left: 22.w, right: 22.w, top: 20.h),
          margin: EdgeInsets.only(right: 16.w),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 72.h,
              width: 72.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(
                      image: AssetImage(
                        model.dummyViewedProduct[index].productImage.toString(),
                      ),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 8.h),
            Text('\$${model.dummyViewedProduct[index].price.toString()}',
                style: kHead3.copyWith(color: primaryColor))
          ]),
        );
      },
    ),
  );
}

Future<dynamic> customBottomSheet(
    BuildContext context, ProductDetailsViewModel model) {
  return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 582.h,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 560.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r))),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 50.h),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 87.h,
                              width: 87.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                image: DecorationImage(
                                    image: AssetImage(model
                                        .dummyProducts[model.productIndex]
                                        .productImage
                                        .toString()),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(width: 33.w),
                            Column(
                              children: [
                                FittedBox(
                                  alignment: Alignment.center,
                                  child: Text(
                                    '\$${model.dummyProducts[model.productIndex].price}',
                                    style: kHead2.copyWith(color: primaryColor),
                                  ),
                                ),
                                FittedBox(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Available Stock ${model.dummyProducts[model.productIndex].stock}',
                                    style: kBodyS.copyWith(color: primaryColor),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            SizedBox(
                              height: 37.h,
                              width: 37.w,
                              child: const Image(
                                  image: AssetImage(
                                      '${staticAssetsPath}Vector.png'),
                                  fit: BoxFit.cover),
                            )
                          ],
                        ),
                        SizedBox(height: 29.h),
                        SizedBox(
                            height: 24.h, child: Text("Color", style: kHead3)),
                        SizedBox(height: 12.h),
                        SizedBox(
                          height: 24.h,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: model.dummyProducts.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  model.updateProductIndex(index);
                                },
                                child: Container(
                                  height: 24.h,
                                  width: 24.w,
                                  margin: const EdgeInsets.only(right: 8),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: model.dummyProducts[index].color,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 32.h),
                        SizedBox(
                            height: 24.h, child: Text("Size", style: kHead3)),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            CustomTextButton1(
                                onTap: () {
                                  model.updateSelectSize(0);
                                },
                                color: model.selectSize == 0
                                    ? secondaryColor
                                    : whiteColor,
                                text: "L - 42 pieces",
                                style: kBodyS.copyWith(
                                  color: model.selectSize == 0
                                      ? blackColor
                                      : greyColor,
                                ),
                                height: 32.h,
                                width: 96.w,
                                radius: 8.r),
                            SizedBox(width: 16.w),
                            CustomTextButton1(
                                onTap: () {
                                  model.updateSelectSize(1);
                                },
                                color: model.selectSize == 1
                                    ? secondaryColor
                                    : whiteColor,
                                text: "M - 41 pieces",
                                style: kBodyS.copyWith(
                                  color: model.selectSize == 1
                                      ? blackColor
                                      : greyColor,
                                ),
                                height: 32.h,
                                width: 96.w,
                                radius: 8.r),
                          ],
                        ),
                        SizedBox(height: 33.h),
                        SizedBox(
                            height: 24.h,
                            child: Text("Quantity", style: kHead3)),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                model.updateSelectQuantity(-1);
                              },
                              child: CustomAddButton(
                                height: 44.h,
                                width: 44.w,
                                icon: const Icon(Icons.remove),
                                color: model.selectQuantity == -1
                                    ? secondaryColor
                                    : whiteColor,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            CustomTextButton1(
                                onTap: () {
                                  model.updateSelectSize(0);
                                },
                                color: lightGreyColor,
                                text: '${model.quantity}',
                                style: kHead3,
                                height: 44.h,
                                width: 124.w,
                                radius: 12.r),
                            SizedBox(width: 16.w),
                            InkWell(
                              onTap: () {
                                model.updateSelectQuantity(1);
                              },
                              child: CustomAddButton(
                                height: 44.h,
                                width: 44.w,
                                icon: const Icon(Icons.add),
                                color: model.selectQuantity == 1
                                    ? secondaryColor
                                    : whiteColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.h),
                        CustomMainButton(
                            buttonColor: primaryColor,
                            textColor: secondaryColor,
                            onPressed: () {},
                            buttonText: 'Apply'),
                        SizedBox(height: 32.h)
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
      });
}

//
//
//@@@@@@@@@@@@@@@ Detail Section @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//
//

Column _detailsDescriptionProduct(
    ProductDetailsViewModel model, BuildContext context) {
  return Column(
    // ignore: prefer_const_constructors
    children: [
      Container(
        padding: EdgeInsets.only(right: 20.w, left: 20.w),
        child: Column(children: [
          _detailsProduct(model),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: EdgeInsets.all(20.r),
            // height: 252.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Product Description', style: kHead3),
              SizedBox(height: 4.h),
              ReadMoreText(
                "${model.dummyProducts[model.productIndex].description}",
                style: kBodyM,
                trimLines: 7,
                colorClickableText: linkAndActionColor,
                trimMode: TrimMode.Line,
                trimCollapsedText: '\n\nView more',
                textAlign: TextAlign.center,
                trimExpandedText: '\n\nView less',
              ),
            ]),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            height: 156.h,
            width: double.infinity,
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
            ),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 33.h,
                    child: Text(
                      "4.7",
                      style: kHead1.copyWith(height: 1.3),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  SizedBox(
                    height: 24.h,
                    width: 24.w,
                    child: SvgPicture.asset(
                      '${staticAssetsPath}star-fill.svg',
                      fit: BoxFit.contain,
                      // color: whiteColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                'View a rating',
                style: kLinkOrAction.copyWith(color: linkAndActionColor),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  CustomTextButton1(
                      onTap: () {},
                      color: lightGreyColor,
                      text: 'Ask product',
                      style: kLinkOrAction.copyWith(color: primaryColor),
                      height: 32.h,
                      width: 140.w,
                      radius: 8.r),
                  SizedBox(width: 20.w),
                  CustomTextButton1(
                      onTap: () {
                        Get.to(() => const ReviewsScreen());
                      },
                      color: lightGreyColor,
                      text: 'See review',
                      style: kLinkOrAction.copyWith(color: primaryColor),
                      height: 32.h,
                      width: 140.w,
                      radius: 8.r),
                ],
              )
            ]),
          ),
          SizedBox(
            height: 24.h,
          ),
        ]),
      ),
      Container(
        padding: EdgeInsets.only(left: 20.w),
        height: 96.h,
        width: double.infinity,
        color: whiteColor,
        child: Row(
          children: [
            CustomAddButton(
                height: 56.h,
                width: 56.w,
                icon: const Icon(Icons.add),
                color: lightGreyColor),
            Expanded(
              child: CustomBottomButton(
                  name: "Pay Now",
                  onTap: () {
                    customBottomSheet(context, model);
                  }),
            ),
          ],
        ),
      )
    ],
  );
}

Container _detailsProduct(ProductDetailsViewModel model) {
  return Container(
    padding: EdgeInsets.only(left: 20.w, top: 20.h, bottom: 20.h),
    //height: 338.h,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.r),
      color: whiteColor,
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Details Product', style: kHead3),
      SizedBox(height: 12.h),
      DetailsProductItems(
        leftText: "Category",
        rightText: "Trademark",
        style: kBodyM,
      ),
      SizedBox(height: 4.h),
      DetailsProductItems(
        leftText: "${model.dummyProducts[model.productIndex].categroy}",
        rightText: "${model.dummyProducts[model.productIndex].trademark}",
        style: kBodyM.copyWith(color: blackColor),
      ),
      SizedBox(height: 16.h),
      DetailsProductItems(
        leftText: "Provided by",
        rightText: "Origin",
        style: kBodyM,
      ),
      SizedBox(height: 4.h),
      DetailsProductItems(
        leftText: "${model.dummyProducts[model.productIndex].providedby}",
        rightText: "${model.dummyProducts[model.productIndex].origin}",
        style: kBodyM.copyWith(color: blackColor),
      ),
      SizedBox(height: 16.h),
      DetailsProductItems(
        leftText: "Warranty form",
        rightText: "Waterproof",
        style: kBodyM,
      ),
      SizedBox(height: 4.h),
      DetailsProductItems(
        leftText: "${model.dummyProducts[model.productIndex].warrantyfrom}",
        rightText: "${model.dummyProducts[model.productIndex].waterproof}",
        style: kBodyM.copyWith(color: blackColor),
      ),
      SizedBox(height: 16.h),
      DetailsProductItems(
        leftText: "Accessories Included",
        rightText: "SKU",
        style: kBodyM,
      ),
      SizedBox(height: 4.h),
      DetailsProductItems(
        leftText:
            "${model.dummyProducts[model.productIndex].accessoriesinclude}",
        rightText: "#${model.dummyProducts[model.productIndex].id}",
        style: kBodyM.copyWith(color: blackColor),
      ),
    ]),
  );
}

// ignore: must_be_immutable
class DetailsProductItems extends StatelessWidget {
  String leftText;
  String rightText;
  TextStyle style;
  DetailsProductItems(
      {Key? key,
      required this.leftText,
      required this.rightText,
      required this.style})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 162.h,
          child: Text(
            leftText,
            style: style,
          ),
        ),
        SizedBox(width: 20.w),
        Text(
          rightText,
          style: style,
        )
      ],
    );
  }
}
