// ignore: use_key_in_widget_constructors
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../core/constants/colors.dart';

class FilledRoundedPinPut extends StatefulWidget {
  final onCompletion;

  // ignore: use_key_in_widget_constructors
  const FilledRoundedPinPut({
    required this.onCompletion,
  });
  @override
  // ignore: library_private_types_in_public_api
  _FilledRoundedPinPutState createState() => _FilledRoundedPinPutState();

  @override
  String toStringShort() => 'Rounded Filled';
}

class _FilledRoundedPinPutState extends State<FilledRoundedPinPut> {
  final controller = TextEditingController();
  final focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    return Pinput(
      textInputAction: TextInputAction.done,
      validator: (value) {
        String pattern = r'^[0-9]*$';
        RegExp regExp = RegExp(pattern);
        if (value!.isEmpty) {
          return 'Please enter OTP';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter valid OTP';
        } else if (value.length < 4) {
          return 'Please enter valid OTP';
        } else {
          return null;
        }
      },
      length: 4,
      controller: controller,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      focusNode: focusNode,
      enabled: true,
      errorText: showError ? 'Invalid OTP' : null,
      defaultPinTheme: defaultPinTheme,
      onCompleted: widget.onCompletion,
      focusedPinTheme: defaultPinTheme.copyWith(
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: primaryColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        decoration: BoxDecoration(
          border: Border.all(color: greyColor),
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
