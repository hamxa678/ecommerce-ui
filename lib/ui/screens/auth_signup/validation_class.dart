import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/signup_body.dart';
import 'package:flutter_antonx_boilerplate/locator.dart';

class InputValidation extends ChangeNotifier {
  final SignUpBody signUpBody = locator<SignUpBody>();
  //final UpdatePasswordBody updatePasswordBody = locator<UpdatePasswordBody>();

  ///
  /// Name Validation
  ///
  String? nameValidation(String? value) {
    String pattern = r'(^[0-9])';
    RegExp regex = RegExp(pattern);
    return value != null && value.length < 4
        ? "Name should be at least 4 char"
        : regex.hasMatch(value!)
            ? "Name should not contain numbers"
            : null;
  }

  ///
  /// Email Validation
  ///
  String? validateEmail(String? value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (value!.isNotEmpty) {
      if (regex.hasMatch(value)) {
        return null;
      } else {
        return "Invalid email";
      }
    } else {
      return "Email is required";
    }
  }

  ///
  /// Password Validation
  ///
  String? validatePassword(String? value) {
    return value != null && value.length < 8
        ? "Password should at least 8 characters"
        : null;
  }

  ///
  /// Confirmed Password Validation
  ///
  String? confirmedPasswordlValidation(String? value) {
    if (value != null && value.length < 8) {
      return "Password should at least 8 characters";
    } else if (value == signUpBody.password) {
      return null;
    } else {
      return "Password does not match";
    }
  }
}
