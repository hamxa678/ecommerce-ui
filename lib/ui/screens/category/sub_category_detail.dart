import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_detailedcard.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_filter_button.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/category/category_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/producr_details_section/product_details_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class SubCategoryDetails extends StatelessWidget {
  const SubCategoryDetails({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryViewModel(),
      child: Consumer<CategoryViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 68.h),
                child: Column(
                  children: [
                    /// --- App Bar ---
                    ///
                    /// Custom App bar
                    ///
                    _customAppBar(title!, model),

                    /// ----- body -----
                    ///
                    /// Custom brand list view
                    ///
                    _customBrandListView(model),

                    ///
                    /// this include filter bar and Detailed Card
                    ///
                    _filterAndDetailedCardSection(model)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _filterAndDetailedCardSection(CategoryViewModel model) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          ///
          /// Custom filter bar
          ///
          CustomFilterButton(
              onTapFilter: () {},
              filterResults: 233,
              filterText: "All Product"),

          SizedBox(
            height: 16.h,
          ),

          ///
          /// Custom Detailed Card
          ///
          _customDetailedCard(model),
          SizedBox(
            height: 16.h,
          ),
        ],
      ),
    );
  }
}

///
/// Custom App bar funtion def
///
Widget _customAppBar(String title, CategoryViewModel model) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: CustomAppBar(
          trailingIcon: SvgPicture.asset(
            '${staticAssetsPath}arrow-left.svg',
            height: 20.h,
            width: 20.h,
            fit: BoxFit.scaleDown,
          ),
          trailingIconAction: () {
            Get.back();
          },
          title: Text(
            title,
            style: kHead2,
          ),
          leadingFirstIcon: SvgPicture.asset(
            '${staticAssetsPath}share-fill.svg',
            height: 20.h,
            width: 20.h,
            color: blackColor,
          ),
          leadingFirstIconAction: (() {
            toastFunction();
          }),
          leadingSecondIcon: SvgPicture.asset(
            '${staticAssetsPath}shopping-cart-fill.svg',
            height: 20.h,
            width: 20.h,
            color: blackColor,
          ),
          leadingSecondIconAction: (() {
            toastFunction();
          }),
        ),
      ),
      SizedBox(height: 24.h),
    ],
  );
}

///
/// Custom brand list view funtion def
///
Widget _customBrandListView(CategoryViewModel model) {
  return Column(
    children: [
      SizedBox(
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
                        ? BrandCard(image: null, index: index)
                        : BrandCard(
                            image: model.brandsData[index - 2].image!,
                            index: null);
          }),
        ),
      ),
      SizedBox(height: 16.h),
    ],
  );
}

///
/// Custom Detailed Card funtion def
///
Widget _customDetailedCard(CategoryViewModel model) {
  return GridView.builder(
    padding: const EdgeInsets.only(top: 0),
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 160.w / 252.h,
        maxCrossAxisExtent: 200,
        crossAxisSpacing: 15.w,
        mainAxisSpacing: 16.h),
    itemCount: model.detailedCardData.length,
    itemBuilder: (context, index) => GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailsScreen());
      },
      child: CustomDetailedCard(
          title: model.detailedCardData[index].title!,
          rating: model.detailedCardData[index].rating!,
          noOfRating: model.detailedCardData[index].noOfRating!,
          newPrice: model.detailedCardData[index].newPrice!,
          discountPercentage: model.detailedCardData[index].discountPercentage!,
          imageURL: model.detailedCardData[index].imageURL!,
          installmentPercent:
              model.detailedCardData[index].installmentPercent!),
    ),
  );
}

class BrandCard extends StatelessWidget {
  const BrandCard({Key? key, required this.image, required this.index})
      : super(key: key);
  final String? image;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 88.h,
          padding: EdgeInsets.symmetric(horizontal: 19.w, vertical: 20.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              color: (index == 1) ? primaryColor : whiteColor),
          child: Center(
            child: (index == 1)
                ? Text(
                    "All",
                    style: kHead3.copyWith(color: secondaryColor, height: 1),
                  )
                : Image(
                    image: AssetImage(image!),
                    fit: BoxFit.scaleDown,
                  ),
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }
}
