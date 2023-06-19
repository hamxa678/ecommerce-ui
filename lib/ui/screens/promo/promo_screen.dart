import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/cutom_title_banner.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/cart/cart_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/notification/notification_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/promo/coupon_detail.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/promo/promo_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class PromoScreen extends StatelessWidget {
  const PromoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PromoScreenViewModel(),
      child: Consumer<PromoScreenViewModel>(
          builder: (context, model, child) => ModalProgressHUD(
                inAsyncCall: model.state == ViewState.busy,
                child: DefaultTabController(
                  initialIndex: 0,
                  length: 4,
                  child: Scaffold(
                      backgroundColor: lightGreyColor,
                      body: Column(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 31.h),
                            child: CustomAppBar(
                              trailingIcon: Image(
                                image: const AssetImage(
                                  '${staticImagesAssetsPath}promo.png',
                                ),
                                height: 23.48.h,
                                width: 25.w,
                                fit: BoxFit.scaleDown,
                              ),
                              title: Text(
                                "Promo",
                                style: kHead2,
                              ),
                              leadingIcon: SvgPicture.asset(
                                '${staticIconsAssetsPath}archieve.svg',
                                height: 20.h,
                                width: 20.h,
                                color: blackColor,
                              ),
                              leadingFirstIcon: SvgPicture.asset(
                                '${staticAssetsPath}bell-fill.svg',
                                height: 20.h,
                                width: 20.h,
                                color: blackColor,
                              ),
                              leadingFirstIconAction: () {
                                Get.to(() => const NotificationScreen());
                              },
                              leadingSecondIcon: SvgPicture.asset(
                                '${staticAssetsPath}shopping-cart-fill.svg',
                                height: 20.h,
                                width: 20.h,
                                color: blackColor,
                              ),
                              leadingSecondIconAction: () {
                                Get.to(() => const CartScreen());
                              },
                            ),
                          ),
                          _tabBar(),
                          _tabBarView(model),
                        ],
                      )),
                ),
              )),
    );
  }

  Widget _tabBarView(PromoScreenViewModel model) {
    return Expanded(
      child: TabBarView(
        children: [
          ///
          /// No design for Code Effective Tab bar view
          ///
          const Center(
            child: Text('No design for Code Effective'),
          ),
          _latestCode(model),

          ///
          /// No design for About Expire Tab bar view
          ///
          const Center(
            child: Text('No design for About Expire'),
          ),
          _codeBrand(model),
        ],
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
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
        Text("Code Effective"),
        Text("Latest Coded"),
        Text("About expire"),
        Text("Code brand"),
      ],
    );
  }
}

Widget _latestCode(PromoScreenViewModel model) {
  return Padding(
    padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 68.h),
    child: SingleChildScrollView(
      child: Column(
        children: [
          CustomBanner(
            text: Text(
              'Discount code',
              style: kHead3,
            ),
            leadingWidget: Text(
              'Applicable maximum: 01',
              style: kBodyS,
            ),
          ),
          SizedBox(height: 12.h),
          coupon(model),
          SizedBox(height: 32.h),
          CustomBanner(
            text: Text(
              'Shipping code',
              style: kHead3,
            ),
            leadingWidget: Text(
              'Applicable maximum: 01',
              style: kBodyS,
            ),
          ),
          SizedBox(height: 20.h),
          coupon(model),
          SizedBox(height: 16.h),
          coupon(model),
          SizedBox(height: 16.h),
          coupon(model),
          SizedBox(height: 20.h),
        ],
      ),
    ),
  );
}

Widget _codeBrand(model) {
  return SingleChildScrollView(
    child: Column(children: [
      Container(
        margin: EdgeInsets.fromLTRB(0, 24.h, 0, 16.h),
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
                            image: model.brandsData[index - 2].image,
                            index: null);
          }),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              height: 68.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
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
            SizedBox(height: 16.h),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 160.w / 120.h,
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 15.w,
                  mainAxisSpacing: 16.h),
              itemCount: 8,
              itemBuilder: (context, index) => _codeBrandCard(model),
            ),
            SizedBox(
              height: (68 + 16).h,
            )
          ],
        ),
      ),
    ]),
  );
}

class Card2 extends StatelessWidget {
  const Card2({Key? key, required this.image, required this.index})
      : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final image;
  // ignore: prefer_typing_uninitialized_variables
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

Widget coupon(PromoScreenViewModel model) {
  return Stack(
    children: [
      GestureDetector(
        onTap: () {
          Get.to(() => const CouponDetailScreen());
        },
        child: Container(
          height: 151.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: whiteColor),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
                width: 252.1.w,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Personal 10% with IDDQD15',
                        style: kHead4.copyWith(color: primaryColor),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        '84 times left in use today',
                        style: kBodyM,
                      ),
                      Expanded(child: SizedBox(height: 30.h)),
                      Text(
                        'DR3846',
                        style: kHead2,
                      ),
                    ]),
              ),
              DashedLine(height: 124.h, color: lightGreyColor),
              SizedBox(
                height: 151.h,
                width: 79.w,
                child: Center(
                    child: Container(
                  //padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                  height: 40.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(4.r)),
                  child: Center(
                    child: Text(
                      'May 08',
                      textAlign: TextAlign.center,
                      style: kLinkOrAction.copyWith(color: blackColor),
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 0,
        right: 70.w,
        child: SvgPicture.asset(
          '${staticIconsAssetsPath}DD.svg',
          height: 12.h,
          width: 24.h,
          fit: BoxFit.scaleDown,
        ),
      ),
      Positioned(
        bottom: 0,
        right: 70.w,
        child: SvgPicture.asset(
          '${staticIconsAssetsPath}DU.svg',
          height: 12.h,
          width: 24.h,
          fit: BoxFit.scaleDown,
        ),
      ),
    ],
  );
}

class DashedLine extends StatelessWidget {
  final double height;
  final Color color;

  const DashedLine({Key? key, required this.height, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return CustomPaint(
          size: Size(3, height),
          painter: _DashedLinePainter(height: height, color: color),
        );
      },
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double height;
  final Color color;
  final double gap = 7.h;

  _DashedLinePainter({required this.height, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5.w
      ..strokeCap = StrokeCap.round;
    double startY = 0;
    while (startY < height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + gap), paint);
      startY += gap * 2;
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter oldDelegate) => true;
}

Widget _codeBrandCard(model) {
  return SizedBox(
    height: 120.h,
    width: 160.w,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.fromLTRB(6.w, 40.h, 6.w, 20.h),
            height: 104.h,
            width: 160.w,
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(8.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Smart phone',
                  style: kHead4,
                ),
                Text(
                  'Online techlonogi store',
                  style: kBodyS,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            height: 48.h,
            width: 80.w,
            child: Stack(children: [
              Container(
                height: 48.h,
                width: 48.h,
                decoration: BoxDecoration(
                    border: Border.all(color: whiteColor, width: 2),
                    color: Colors.red,
                    shape: BoxShape.circle),
                child: SvgPicture.asset(
                  '${staticIconsAssetsPath}Pbox.svg',
                  height: 24.h,
                  width: 24.h,
                  fit: BoxFit.scaleDown,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    height: 48.h,
                    width: 48.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: whiteColor, width: 2),
                        color: lightGreyColor,
                        shape: BoxShape.circle),
                    child: Center(
                      child: Text(
                        '24%',
                        style: kLinkOrAction.copyWith(color: primaryColor),
                      ),
                    )),
              ),
            ]),
          ),
        )
      ],
    ),
  );
}
