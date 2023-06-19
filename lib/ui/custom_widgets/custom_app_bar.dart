import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.trailingIcon,
      required this.title,
      this.leadingIcon,
      this.leadingFirstIcon,
      this.leadingSecondIcon,
      this.trailingIconAction,
      this.leadingIconAction,
      this.leadingFirstIconAction,
      this.leadingSecondIconAction})
      : super(key: key);
  final Text title;
  final Widget trailingIcon;
  final Widget? leadingIcon;
  final Widget? leadingFirstIcon;
  final Widget? leadingSecondIcon;
  final VoidCallback? trailingIconAction;
  final VoidCallback? leadingIconAction;
  final VoidCallback? leadingFirstIconAction;
  final VoidCallback? leadingSecondIconAction;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32.h,
      child: Row(
        children: [
          InkWell(
            onTap: trailingIconAction,
            child: trailingIcon,
          ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(child: title),
          if (leadingIcon != null)
            InkWell(
              onTap: leadingIconAction,
              child: leadingIcon,
            ),
          if (leadingIcon != null)
            SizedBox(
              width: 16.w,
            ),
          if (leadingFirstIcon != null)
            InkWell(
              onTap: leadingFirstIconAction,
              child: leadingFirstIcon,
            ),
          if (leadingFirstIcon != null)
            SizedBox(
              width: 16.w,
            ),
          if (leadingSecondIcon != null)
            InkWell(
              onTap: leadingSecondIconAction,
              child: leadingSecondIcon,
            ),
        ],
      ),
    );
  }
}
