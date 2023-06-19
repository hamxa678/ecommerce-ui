import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constants/strings.dart';

class CustomBanner extends StatelessWidget {
  const CustomBanner(
      {Key? key,
      required this.text,
      this.leadingWidget,
      this.leadingAction,
      this.underlined = false})
      : super(key: key);
  final Widget text;
  final Widget? leadingWidget;
  final VoidCallback? leadingAction;
  final bool underlined;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (underlined == false)
            ? text
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text,
                  SizedBox(
                    height: 4.h,
                  ),
                  SvgPicture.asset(
                    '${staticAssetsPath}bLine.svg',
                  ),
                ],
              ),
        const Spacer(),
        if (leadingWidget != null)
          InkWell(onTap: leadingAction, child: leadingWidget),
      ],
    );
  }
}
