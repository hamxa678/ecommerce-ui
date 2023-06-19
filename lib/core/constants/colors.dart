import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

///
/// Update the colors below according to your use case.
///
const Color primaryColor = Color(0xFF4E55AF);
const Color secondaryColor = Color(0xFFA1DBF5);
const Color tertiaryColorRed = Color(0xFFF6565D);
const Color tertiaryColorYellow = Color(0xFFFDD446);
const Color blackColor = Color(0xFF0D0F23);
const Color greyColor = Color(0xFFA0A1B4);
const Color lightGreyColor = Color(0xFFF7F7F7);
const Color whiteColor = Color(0xFFFFFFFF);
const Color linkAndActionColor = Color(0xFF00D2E0);
const Color primaryLightColor = Color(0xFF494F86);
final defaultPinTheme = PinTheme(
  width: 50.w,
  height: 50.w,
  textStyle: kHead1.copyWith(color: primaryColor),
  decoration: BoxDecoration(
    color: lightGreyColor,
    borderRadius: BorderRadius.circular(16.r),
    border: Border.all(color: greyColor),
  ),
);
