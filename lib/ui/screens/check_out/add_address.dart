import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_antonx_boilerplate/core/constants/toastFuntion.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/button/custom_main_button.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_app_bar.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/check_out_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CheckOutViewModel(context),
      child: Consumer<CheckOutViewModel>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: lightGreyColor,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.w, 69.h, 20.w, 0),
                child: Column(
                  children: [

                    /// 
                    /// Custom AppBar
                    /// 
                    _customAppBar(),

                    ///
                    /// Body
                    ///
                    _googleMap(model),
                    
                    _addressForm(model, context)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _addressForm(CheckOutViewModel model, BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          enable: false,
          textFieldColor: whiteColor,
          hintText: "Hamza Khan",
          hintStyle: kHead4,
          prefexIcon: SvgPicture.asset(
            '${staticAssetsPath}person-fill.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: model.locationController,
          textFieldColor: whiteColor,
          hintText: "Location",
          hintStyle: kHead4,
          prefexIcon: SvgPicture.asset(
            '${staticIconsAssetsPath}Location.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            CustomTextField(
              controller: model.cityController,
              width: 161.w,
              enable: false,
              textFieldColor: whiteColor,
              hintText: "City",
              hintStyle: kHead4,
              prefexIcon: SvgPicture.asset(
                '${staticIconsAssetsPath}navigation.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            const SizedBox(width: 16),
            CustomTextField(
              controller: model.postalCodeController,
              width: 158.w,
              textFieldColor: whiteColor,
              hintText: "Postal code",
              hintStyle: kHead4,
              prefexIcon: SvgPicture.asset(
                '${staticIconsAssetsPath}copy.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: model.stateController,
          textFieldColor: whiteColor,
          hintText: "State",
          hintStyle: kHead4,
          prefexIcon: SvgPicture.asset(
            '${staticIconsAssetsPath}at-fill.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        SizedBox(height: 16.h),
        CustomTextField(
          controller: model.countryController,
          textFieldColor: whiteColor,
          hintText: "Country",
          hintStyle: kHead4,
          prefexIcon: SvgPicture.asset(
            '${staticIconsAssetsPath}at-fill.svg',
            fit: BoxFit.scaleDown,
          ),
        ),
        //const Spacer(),
        SizedBox(height: 62.h),
        CustomMainButton(
            buttonColor: primaryColor,
            textColor: secondaryColor,
            onPressed: () {
              model.addressAlert(context, model);
            },
            buttonText: 'Submit'),
      ],
    );
  }

  Widget _googleMap(CheckOutViewModel model) {
    return Column(
      children: [
        Container(
          height: 200.h,
          width: double.infinity,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              color: const Color(0xff8A959E).withOpacity(0.08),
              offset: Offset(0, 16.h),
              blurRadius: 24.r,
            )
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: GoogleMap(
              onMapCreated: (GoogleMapController controller) {
                controller.setMapStyle(model.mapTheme);
                model.googleMapController.complete(controller);
              },
              compassEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition:
                  CameraPosition(target: model.latlong, zoom: 15),
              markers: {if (model.marker != null) model.marker!},
              onTap: (cordinate) {
                // print(cordinate);
                model.updateCordinate(cordinate);
              },
            ),
          ),
        ),
        SizedBox(height: 16.h),
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
          trailingIconAction: (() {
            Get.back();
          }),
          title: Text(
            "Address",
            style: kHead2,
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}

Widget addAddressModalBottomSheet(
  BuildContext context,
  CheckOutViewModel model,
) {
  return SizedBox(
    height: (446 + 22).h,
    child: Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: (446).h,
            width: double.infinity,
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r))),
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.w, 59.h, 20.w, 32.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                      height: 31.h,
                      child: Text('Alert Shipping', style: kHead2)),
                  SizedBox(height: 32.h),
                  SizedBox(
                    height: 52.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 295.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: 24.h,
                                child: Text(
                                  'Default Address',
                                  style: kHead3,
                                ),
                              ),
                              SizedBox(
                                height: 24.h,
                                child: Text(
                                  '799/47, Sri Jayawardenepura Kotte. Jayawardenepura Kotte.',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: kBodyL,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: Radio(
                              activeColor: primaryColor,
                              value: 'Default',
                              groupValue: 'Default',
                              onChanged: (value) => {}),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    height: 24.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Send to a Different Address',
                          style: kHead3,
                        ),
                        SizedBox(
                          height: 20.h,
                          width: 20.w,
                          child: Radio(
                              activeColor: primaryColor,
                              value: 'Default',
                              groupValue: 'Default',
                              onChanged: (value) => {}),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    height: 88.h,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.h, horizontal: 18.w),
                    decoration: BoxDecoration(
                        color: lightGreyColor,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Center(
                        child: Text(
                      'No 480-B Koswatta Junction, Nawala Road, Sri Jayawardenepura Kotte.',
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.center,
                      style: kBodyL,
                    )),
                  ),
                  SizedBox(height: 32.h),
                  CustomMainButton(
                      buttonColor: primaryColor,
                      textColor: secondaryColor,
                      onPressed: () {
                        toastFunction();
                      },
                      buttonText: 'Submit')
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
