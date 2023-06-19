import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/cart/cart_screen_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/check_out_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartViewModel(),
      child: Consumer<CartViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            bottomNavigationBar: BottomAppBar(
                child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 32.h),
              height: 151.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Total',
                          style: kHead3,
                        ),
                        const Spacer(),
                        Text(
                          '\$412.00',
                          style: kHead3,
                        ),
                      ],
                    ),
                    CustomMainButton(
                        buttonColor: primaryColor,
                        textColor: secondaryColor,
                        onPressed: () {
                          model.checkOut();
                          (model.flag == false)
                              ? showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return modalBottomSheet();
                                  },
                                )
                              : Get.to(const CheckOut());
                        },
                        buttonText: "Check Out")
                  ]),
            )),
            backgroundColor: lightGreyColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 0),
                child: Column(
                  children: [
                    CustomAppBar(
                      trailingIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}close.svg',
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                      trailingIconAction: (() {
                        Get.back();
                      }),
                      title: Text(
                        "Cart",
                        style: kHead2,
                      ),
                      leadingFirstIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}bookmark-fill.svg',
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                      leadingFirstIconAction: (() {
                        toastFunction();
                      }),
                      leadingSecondIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}more-horizontal.svg',
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                      leadingSecondIconAction: (() {
                        toastFunction();
                      }),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 0),
                      shrinkWrap: true,
                      itemCount: model.cartItemCardData.length,
                      itemBuilder: ((context, index) => CartItemCard(
                          imageURL: model.cartItemCardData[index].imageURL,
                          title: model.cartItemCardData[index].title,
                          price: model.cartItemCardData[index].price,
                          discount: model.cartItemCardData[index].discount,
                          noOfAvailableStock: model
                              .cartItemCardData[index].noOfAvailableStock)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 217.w,
                          child: CustomTextField(
                            textFieldColor: whiteColor,
                            controller: model.couponController,
                            hintText: 'Coupon',
                            prefexIcon: SvgPicture.asset(
                              '${staticIconsAssetsPath}pricetag-fill.svg',
                              height: 20.h,
                              width: 20.h,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16.w,
                        ),
                        Expanded(
                          child: CustomMainButton(
                              height: 46.h,
                              buttonColor: primaryColor,
                              textColor: secondaryColor,
                              onPressed: () {
                                toastFunction();
                              },
                              buttonText: "Apply"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Row(
                      children: [
                        Text(
                          'See more coupon',
                          style: kBodyM,
                        ),
                        SizedBox(
                          width: 9.w,
                        ),
                        InkWell(
                          onTap: () {
                            toastFunction();
                          },
                          child: Text(
                            'See all',
                            style: kLinkOrAction.copyWith(color: primaryColor),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Container(
                      height: 184.h,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        color: whiteColor,
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  '${staticIconsAssetsPath}i1.svg',
                                  height: 16.h,
                                  width: 16.h,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 16.w),
                                Text(
                                  'Sub Total',
                                  style: kBodyM,
                                ),
                                const Spacer(),
                                Text(
                                  '\$469.00',
                                  style: kBodyL.copyWith(color: blackColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  '${staticIconsAssetsPath}i2.svg',
                                  height: 16.h,
                                  width: 16.h,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 16.w),
                                Text(
                                  'Delivery',
                                  style: kBodyM,
                                ),
                                const Spacer(),
                                Text(
                                  '\$37.00',
                                  style: kBodyL.copyWith(color: blackColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  '${staticIconsAssetsPath}i3.svg',
                                  height: 16.h,
                                  width: 16.h,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 16.w),
                                Text(
                                  'Tax (5%)',
                                  style: kBodyM,
                                ),
                                const Spacer(),
                                Text(
                                  '\$7.00',
                                  style: kBodyL.copyWith(color: blackColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  '${staticIconsAssetsPath}i4.svg',
                                  height: 16.h,
                                  width: 16.h,
                                  fit: BoxFit.scaleDown,
                                ),
                                SizedBox(width: 16.w),
                                Text(
                                  'Provisional Invoice',
                                  style: kHead3.copyWith(color: greyColor),
                                ),
                                const Spacer(),
                                Text(
                                  '\$415.00',
                                  style: kHead3,
                                ),
                              ],
                            ),
                          ]),
                    ),
                    SizedBox(
                      height: 48.h,
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

// ignore: must_be_immutable
class CartItemCard extends StatelessWidget {
  CartItemCard(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.price,
      this.discount,
      required this.noOfAvailableStock})
      : super(key: key);
  String? imageURL;
  String? title;
  double? price;
  int? discount;
  int? noOfAvailableStock;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(25.w, 20.h, 70.w, 20.h),
          height: 184.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff8A959E).withOpacity(0.08),
                  offset: Offset(0.w, 16.h),
                  blurRadius: 24.r,
                  spreadRadius: 0.r,
                )
              ]),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.h),
                height: double.infinity,
                width: 83.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    image: DecorationImage(
                        image: AssetImage(imageURL!), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: kHead4,
                    ),
                    SizedBox(
                      height: 31.h,
                      child: Row(
                        children: [
                          Text(
                            '\$$price',
                            style: kHead2.copyWith(color: primaryColor),
                          ),
                          SizedBox(
                            width: 26.w,
                          ),
                          if (discount != null)
                            Text('$discount%', style: kBodyM),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16.8.h,
                      child: (noOfAvailableStock == 0)
                          ? Text(
                              'Out of Stock',
                              style: kLinkOrAction,
                            )
                          : Text(
                              'Available Stock $noOfAvailableStock',
                              style: kLinkOrAction.copyWith(color: greyColor),
                            ),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff8A959E).withOpacity(0.08),
                                offset: Offset(0.w, 16.h),
                                blurRadius: 24.r,
                                spreadRadius: 0.r,
                              )
                            ],
                            color: whiteColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: SvgPicture.asset(
                            '${staticIconsAssetsPath}minus.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 32.h,
                          width: 56.w,
                          decoration: BoxDecoration(
                              color: lightGreyColor,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: Center(
                            child: Text(
                              '01',
                              style: kLinkOrAction.copyWith(color: blackColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Container(
                          height: 32.h,
                          width: 32.w,
                          decoration: BoxDecoration(
                              color: secondaryColor,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: SvgPicture.asset(
                            '${staticIconsAssetsPath}plus.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}

Widget modalBottomSheet() {
  return SizedBox(
    height: 495.h,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 473.h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 56.h, 20.w, 32.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image(
                    image: const AssetImage(
                        '${staticImagesAssetsPath}CartOFSflag.png'),
                    fit: BoxFit.scaleDown,
                    height: 120.h,
                    width: 120.w,
                  ),
                  SizedBox(
                    height: 66.h,
                  ),
                  Text(
                    'Report Alert!',
                    style: kHead2,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 66.h,
                    width: 260.w,
                    child: Text(
                      'Sorry, It seems some products are out of stock or Quantity not available or mismatch with available stock',
                      textAlign: TextAlign.center,
                      style: kBodyM,
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomMainButton(
                      buttonColor: primaryColor,
                      textColor: secondaryColor,
                      onPressed: () {},
                      buttonText: 'Continue'),
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
