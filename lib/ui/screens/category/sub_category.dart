import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_sub_catagories_card3.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/category/category_viewmodel.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/category/sub_category_detail.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/producr_details_section/product_details_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/strings.dart';

import '../../custom_widgets/custom_detailedcard.dart';
import '../../custom_widgets/custom_filter_button.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({Key? key, required this.title}) : super(key: key);
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
              padding: EdgeInsets.fromLTRB(20.w, 68.h, 20.w, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Appbar
                  
                  /// 
                  /// CustomAppBar
                  /// 
                  _customAppBar(),

                  /// Body
                  
                  _upperItemCollectionGrid(model),
                  _filterBarAndDetailedCardSection(model),
                ],
              ),
            ),
          )),
        ),
      ),
    );
  }

  Widget _filterBarAndDetailedCardSection(CategoryViewModel model) {
    return Column(
      children: [
        CustomFilterButton(
            onTapFilter: () {}, filterResults: 233, filterText: "All Product"),
        SizedBox(height: 16.h),
        GridView.builder(
          padding: EdgeInsets.only(top: 0, bottom: 20.h),
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
                discountPercentage:
                    model.detailedCardData[index].discountPercentage!,
                imageURL: model.detailedCardData[index].imageURL!,
                installmentPercent:
                    model.detailedCardData[index].installmentPercent!),
          ),
        ),
      ],
    );
  }

  Widget _upperItemCollectionGrid(CategoryViewModel model) {
    return Column(
      children: [
        GridView.builder(
          padding: const EdgeInsets.only(top: 0),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              childAspectRatio: 160.w / 104.h,
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 16.h),
          itemCount: model.subCategoryData.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => GestureDetector(
            onTap: (() => Get.to(SubCategoryDetails(
                title: model.subCategoryData[index].categoryTitle!))),
            child: CustomSubCategoriesCard(
                textColor: primaryColor,
                title: model.subCategoryData[index].categoryTitle!,
                image1: model.subCategoryData[index].images!.image1!,
                image2: model.subCategoryData[index].images!.image2!,
                image3: model.subCategoryData[index].images!.image3!),
          ),
        ),
        SizedBox(height: 16.h),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: (() {
              toastFunction();
            }),
            child: Text(
              'View all category',
              style: kLinkOrAction.copyWith(color: const Color(0xff00D2E0)),
            ),
          ),
        ),
        SizedBox(height: 35.h),
      ],
    );
  }

  Widget _customAppBar() {
    return Column(
      children: [
        CustomAppBar(
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
            title!,
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
        SizedBox(height: 28.h),
      ],
    );
  }
}
