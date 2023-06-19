import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/strings.dart';
import '../../../core/constants/styles.dart';
import 'store_viewmodel.dart';

class FilterBottombar extends StatelessWidget {
  const FilterBottombar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => StoreViewModel(),
        child: Consumer<StoreViewModel>(
          builder: (context, model, child) => SizedBox(
            height: 475.h,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 453.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r))),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.w, 54.h, 20.w, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Filter",
                                style: kHead2,
                              ),
                              Text(
                                'Clear',
                                style: kLinkOrAction.copyWith(
                                    color: const Color(0xff00D2E0)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Text(
                            '3 Sub Categories',
                            style: kBodyM,
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: model.storeData.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        FittedBox(
                                          child: Text(
                                            model.storeData[index].productTitle
                                                .toString(),
                                            style: kHead3,
                                          ),
                                        ),
                                        FittedBox(
                                          child: Text(
                                            '${model.storeData[index].items} Items',
                                            style: kBodyM,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                        height: 20.h,
                                        width: 20.w,
                                        child: Radio(
                                            activeColor: primaryColor,
                                            value: model.storeData[index]
                                                .productTitle as String,
                                            groupValue: model.initialFilter,
                                            onChanged: ((value) =>
                                                model.updateInitialFilter(
                                                    value as String)))),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                )
                              ],
                            ),
                          ),
                          CustomMainButton(
                              buttonColor: primaryColor,
                              textColor: secondaryColor,
                              onPressed: () {
                                Get.back();
                              },
                              buttonText: "Show Result")
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
                          borderRadius:
                              BorderRadius.all(Radius.circular(12.r))),
                      child: SvgPicture.asset(
                        '${staticAssetsPath}close.svg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
