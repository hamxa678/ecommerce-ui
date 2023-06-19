import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/other_models/dummy_card_data.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/add_address.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/check_out_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/electronic_invoice.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/payment_method_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckOutViewModel(context),
      child: Consumer<CheckOutViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            bottomNavigationBar: BottomAppBar(
                child: Container(
              padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 32.h),
              height: 228.h,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const ElectronicInvoiceScreen());
                      },
                      child: CustomTextField(
                        height: 60.h,
                        hintStyle: kHead4,
                        hintText: 'Electronic Invoice',
                        prefexIcon: SvgPicture.asset(
                          '${staticIconsAssetsPath}inbox.svg',
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        suffexIcon: SvgPicture.asset(
                          '${staticIconsAssetsPath}arrow-ios-right.svg',
                          height: 16.h,
                          width: 16.h,
                          fit: BoxFit.scaleDown,
                        ),
                        enable: false,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          'Total',
                          style: kHead3,
                        ),
                        const Spacer(),
                        Text(
                          '\$412.00',
                          style: kHead2.copyWith(color: primaryColor),
                        ),
                      ],
                    ),
                    CustomMainButton(
                        buttonColor: primaryColor,
                        textColor: secondaryColor,
                        onPressed: () {},
                        buttonText: "Order")
                  ]),
            )),
            backgroundColor: lightGreyColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 46.h),
                child: Column(
                  children: [
                    CustomAppBar(
                      trailingIcon: SvgPicture.asset(
                        '${staticAssetsPath}arrow-left.svg',
                        height: 20.h,
                        width: 20.h,
                        fit: BoxFit.scaleDown,
                      ),
                      trailingIconAction: (() {
                        Get.back();
                      }),
                      title: Text(
                        "Check Out",
                        style: kHead2,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomContainer(
                      prefexIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}cube-fill.svg',
                        height: 16.h,
                        width: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      title: 'Info Product',
                      editAction: () {
                        toastFunction();
                      },
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(top: 0),
                        shrinkWrap: true,
                        itemCount: readyToCheckOutModelData.length,
                        itemBuilder: (context, index) => ReadyToCheckOutItem(
                          imageURL: readyToCheckOutModelData[index].imageURL!,
                          title: readyToCheckOutModelData[index].title!,
                          sizeLength:
                              readyToCheckOutModelData[index].sizeLength!,
                          price: readyToCheckOutModelData[index].price!,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomContainer(
                      prefexIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}Location.svg',
                        height: 16.h,
                        width: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      title: 'Delivery Address',
                      editAction: () {
                        Get.to(() => const AddAddress());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              'Adom Shafi',
                              style: kBodyM,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              '+440 2556 669 669',
                              style: kBodyM,
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              'Londo, Tesco City',
                              style: kHead4.copyWith(color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomContainer(
                      prefexIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}car.svg',
                        height: 16.h,
                        width: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      title: 'Form of Delivery',
                      editAction: () {
                        toastFunction();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            RichText(
                              text: TextSpan(
                                  text: 'Mul Shipper  ',
                                  style: kBodyS.copyWith(color: primaryColor),
                                  children: [
                                    TextSpan(
                                        text: "Fast delivery", style: kBodyS)
                                  ]),
                            ),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "Monday 4/ 12 - \$8.00 ",
                              style: kHead4.copyWith(color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomContainer(
                      prefexIcon: SvgPicture.asset(
                        '${staticIconsAssetsPath}credit-card.svg',
                        height: 16.h,
                        width: 16.h,
                        fit: BoxFit.scaleDown,
                      ),
                      title: 'Payment Method',
                      editAction: () {
                        Get.to(const PaymentMethod());
                      },
                      child: Padding(
                        padding: EdgeInsets.only(left: 32.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 4.h,
                            ),
                            Text("Master Card", style: kBodyS),
                            SizedBox(
                              height: 4.h,
                            ),
                            Text(
                              "**** **** 7949",
                              style: kHead4.copyWith(color: primaryColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Container(
                      height: 102.h,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(16.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Product',
                                style: kBodyL,
                              ),
                              Text(
                                '\$407.00',
                                style: kHead3,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Shiping',
                                style: kBodyL,
                              ),
                              Text(
                                '\$8.00',
                                style: kHead3,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
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
class CustomContainer extends StatelessWidget {
  CustomContainer(
      {Key? key,
      required this.prefexIcon,
      required this.title,
      required this.editAction,
      required this.child})
      : super(key: key);
  Widget prefexIcon;
  String title;
  Widget child;
  final VoidCallback editAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
      width: 335.w,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(children: [
        Row(
          children: [
            prefexIcon,
            SizedBox(
              width: 16.w,
            ),
            Text(
              title,
              style: kHead4.copyWith(color: primaryColor),
            ),
            const Spacer(),
            InkWell(
              onTap: editAction,
              child: Text(
                'Edit',
                style: kLinkOrAction.copyWith(color: const Color(0xff00D2E0)),
              ),
            ),
          ],
        ),
        SizedBox(width: double.infinity, child: child),
      ]),
    );
  }
}

// ignore: must_be_immutable
class ReadyToCheckOutItem extends StatelessWidget {
  ReadyToCheckOutItem(
      {Key? key,
      required this.imageURL,
      required this.title,
      required this.sizeLength,
      required this.price})
      : super(key: key);
  String imageURL;
  String title;
  String sizeLength;
  double price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16.h,
        ),
        Row(
          children: [
            Container(
              height: 48.h,
              width: 48.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(image: AssetImage(imageURL))),
            ),
            SizedBox(
              width: 16.w,
            ),
            SizedBox(
              width: 231.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: kBodyM,
                  ),
                  Row(
                    children: [
                      Text(
                        'SL: $sizeLength',
                        style: kBodyM.copyWith(color: blackColor),
                      ),
                      const Spacer(),
                      Text(
                        '\$$price',
                        style: kHead4.copyWith(color: primaryColor),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
