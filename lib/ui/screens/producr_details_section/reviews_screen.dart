import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/producr_details_section/product_details_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/strings.dart';
import '../../../core/constants/styles.dart';
import '../../custom_widgets/custom_app_bar_1.dart';

class ReviewsScreen extends StatelessWidget {
  const ReviewsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductDetailsViewModel(),
      child: Consumer<ProductDetailsViewModel>(
          builder: (context, model, child) => Scaffold(
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20.r),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 49.h),
                        CustomAppBar1(
                          leadingIcon: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: SvgPicture.asset(
                              '${staticAssetsPath}arrow-left.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                          title: Text("Reviews", style: kHead2),
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
                        SizedBox(height: 16.h),
                        _productDetail(model),
                        SizedBox(height: 16.h),
                        _productReviews(model),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }

  SizedBox _productReviews(ProductDetailsViewModel model) {
    return SizedBox(
      height: double.maxFinite,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: model.reviews.length,
        itemBuilder: ((context, index) {
          return Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
            margin: EdgeInsets.only(bottom: 16.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              color: whiteColor,
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    height: 40.h,
                    width: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                          image: AssetImage(
                              model.reviews[index].imageURL.toString()),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${model.reviews[index].name}',
                        style: kHead3,
                      ),
                      Text(
                        '${model.reviews[index].date}',
                        style: kBodyS,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 230.w,
                child: Text(
                  '${model.reviews[index].review}',
                  style: kBodyM,
                ),
              ),
              SizedBox(height: 8.h),
              RatingBar.builder(
                itemSize: 16.sp,
                initialRating: model.reviews[index].stars,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemBuilder: (context, _) {
                  return SvgPicture.asset(
                    '${staticAssetsPath}star-fill.svg',
                    fit: BoxFit.contain,
                    // color: whiteColor,
                  );
                },
                onRatingUpdate: (rating) {
                  //print(rating);
                },
              ),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const Spacer(),
                  Text('${model.reviews[index].heart}'),
                  SizedBox(width: 5.w),
                  SizedBox(
                    height: 16.h,
                    width: 16.w,
                    child: SvgPicture.asset(
                      '${staticAssetsPath}heart-fill.svg',
                      fit: BoxFit.contain,
                      // color: whiteColor,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Text('${model.reviews[index].message}'),
                  SizedBox(width: 5.w),
                  SizedBox(
                    height: 16.h,
                    width: 16.w,
                    child: SvgPicture.asset(
                      '${staticAssetsPath}message-square-fill.svg',
                      fit: BoxFit.contain,
                      // color: primaryColor,
                    ),
                  )
                ],
              )
            ]),
          );
        }),
      ),
    );
  }

  Container _productDetail(ProductDetailsViewModel model) {
    return Container(
      height: 120.h,
      width: double.infinity,
      padding:
          EdgeInsets.only(left: 20.w, right: 16.w, top: 23.h, bottom: 23.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: whiteColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 74.h,
            width: 74.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              image: DecorationImage(
                  image: AssetImage(model
                      .dummyProducts[model.productIndex].productImage
                      .toString()),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(width: 20.w),
          SizedBox(
            height: 74.h,
            width: 162,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Text(
                    '${model.dummyProducts[model.productIndex].name}',
                    style: kHead3,
                  ),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    SizedBox(
                      height: 16.h,
                      width: 16.w,
                      child: SvgPicture.asset(
                        '${staticAssetsPath}star-fill.svg',
                        fit: BoxFit.contain,
                        // color: whiteColor,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    SizedBox(
                      height: 22.h,
                      child: Text(
                        "4.7",
                        style: kBodyM.copyWith(color: primaryColor),
                      ),
                    ),
                    SizedBox(width: 7.w),
                    SizedBox(
                      height: 22.h,
                      child: Text(
                        "(567 rating)",
                        style: kBodyM,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  'SKU: ${model.dummyProducts[model.productIndex].id}',
                  style: kBodyS.copyWith(color: blackColor),
                ),
              ],
            ),
          ),
          const Spacer(),
          SizedBox(
            height: 37.h,
            width: 37.w,
            child: const Image(
                image: AssetImage('${staticAssetsPath}Vector.png'),
                fit: BoxFit.contain),
          )
        ],
      ),
    );
  }
}
