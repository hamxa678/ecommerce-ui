import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/colors.dart';
import 'package:flutter_antonx_boilerplate/core/constants/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.obscureText = false,
      this.controller,
      required this.hintText,
      this.prefexIcon,
      this.suffexIcon,
      this.textFieldColor = lightGreyColor,
      this.onTap,
      this.enable = true,
      this.height = 48,
      this.width = double.infinity,
      this.hintStyle,
      this.onSaved,
      this.validator})
      : super(key: key);
  final bool obscureText;
  final TextEditingController? controller;
  final String hintText;
  final Widget? prefexIcon;
  final Widget? suffexIcon;
  final Color textFieldColor;
  final VoidCallback? onTap;
  final bool enable;
  final double? height;
  final double? width;
  final TextStyle? hintStyle;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (suffexIcon != null && prefexIcon != null)
          ? EdgeInsets.zero
          : (suffexIcon == null && prefexIcon == null)
              ? EdgeInsets.symmetric(horizontal: 20.w)
              : (suffexIcon == null && prefexIcon != null)
                  ? EdgeInsets.only(right: 20.w)
                  : null,
      height: height!,
      width: width!,
      decoration: BoxDecoration(
          color: textFieldColor,
          borderRadius: BorderRadius.all(Radius.circular(8.r))),
      child: Center(
        child: TextFormField(
          validator: validator,
          onSaved: onSaved,
          enabled: enable,
          onTap: onTap,
          obscureText: obscureText,
          controller: controller,
          style: kHead4.copyWith(height: 1.65.h),
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: (hintStyle != null) ? hintStyle : kBodyM,
            prefixIcon: prefexIcon,
            suffixIcon: suffexIcon,
          ),
        ),
      ),
    );
  }
}
