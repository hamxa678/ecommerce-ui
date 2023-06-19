import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';

class SocialMediaButtom extends StatelessWidget {
  const SocialMediaButtom(
      {Key? key, required this.child, required this.onPressed})
      : super(key: key);
  final Widget child;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56.h,
        width: 56.h,
        decoration: BoxDecoration(
          color: greyColor.withOpacity(0.2),
          borderRadius: BorderRadius.all(
            Radius.circular(12.r),
          ),
        ),
        child: child,
      ),
    );
  }
}
