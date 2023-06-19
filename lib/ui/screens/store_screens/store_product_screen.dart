import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/store_screens/filter_bottombar.dart';

import 'package:flutter_antonx_boilerplate/ui/screens/store_screens/store_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/strings.dart';
import '../../custom_widgets/custom_detailedcard.dart';
import '../../custom_widgets/custom_filter_button.dart';
import '../../custom_widgets/custom_product_typebar.dart';
import '../../custom_widgets/custom_sub_catagories_card3.dart';
import '../category/category_viewmodel.dart';

// ignore: must_be_immutable
class StoreProductScreen extends StatelessWidget {
  StoreViewModel model;
  StoreProductScreen({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomProductTypeBar(
          productType: "Catagories",
          leadingIcon: Container(
            height: 32.h,
            width: 32.h,
            margin: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              '${staticAssetsPath}catagories-icon.svg',
              fit: BoxFit.cover,
            ),
          ),
          seeMore: "See more",
          trelingIcon: SvgPicture.asset(
            '${staticAssetsPath}arrow-ios-right.svg',
            fit: BoxFit.cover,
            color: greyColor,
          ),
        ),
        SizedBox(height: 30.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              CustomSubCategoriesCard(
                  textColor: blackColor,
                  title: CategoryViewModel().subCategoryData[0].categoryTitle!,
                  image1:
                      CategoryViewModel().subCategoryData[0].images!.image1!,
                  image2:
                      CategoryViewModel().subCategoryData[0].images!.image2!,
                  image3:
                      CategoryViewModel().subCategoryData[0].images!.image3!),
              const Spacer(),
              CustomSubCategoriesCard(
                  textColor: blackColor,
                  title: CategoryViewModel().subCategoryData[0].categoryTitle!,
                  image1:
                      CategoryViewModel().subCategoryData[0].images!.image1!,
                  image2:
                      CategoryViewModel().subCategoryData[0].images!.image2!,
                  image3:
                      CategoryViewModel().subCategoryData[0].images!.image3!),
            ],
          ),
        ),
        SizedBox(height: 30.h),
        CustomProductTypeBar(
          productType: "Product",
          leadingIcon: Container(
            height: 32.h,
            width: 32.h,
            margin: EdgeInsets.only(right: 16.w),
            child: SvgPicture.asset(
              '${staticAssetsPath}product-icon.svg',
              fit: BoxFit.cover,
            ),
          ),
          seeMore: "See more",
          trelingIcon: SvgPicture.asset(
            '${staticAssetsPath}arrow-ios-right.svg',
            fit: BoxFit.cover,
            color: greyColor,
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: CustomFilterButton(
            filterResults: 233,
            filterText: "All Product",
            onTapFilter: () {
              showModalBottomSheet(
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return const FilterBottombar();
                },
              );
            },
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 160.w / 252.h,
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 16.h),
            itemCount: 6,
            itemBuilder: (context, index) => CustomDetailedCard(
                title: CategoryViewModel().detailedCardData[0].title!,
                rating: CategoryViewModel().detailedCardData[0].rating!,
                noOfRating: CategoryViewModel().detailedCardData[0].noOfRating!,
                newPrice: CategoryViewModel().detailedCardData[0].newPrice!,
                discountPercentage:
                    CategoryViewModel().detailedCardData[0].discountPercentage!,
                imageURL: CategoryViewModel().detailedCardData[0].imageURL!,
                installmentPercent: CategoryViewModel()
                    .detailedCardData[0]
                    .installmentPercent!),
          ),
        ),
      ],
    );
  }
}
