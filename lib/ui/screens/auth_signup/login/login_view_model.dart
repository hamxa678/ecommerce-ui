import 'package:flutter/widgets.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/login_body.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/auth_response.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/core/services/auth_service.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/auth_signup/validation_class.dart';
import 'package:logger/logger.dart';

class LoginViewModel extends BaseViewModel {
  final log = Logger();

  AuthService authService = AuthService();
  LoginBody loginBody = LoginBody();
  late AuthResponse response;

  InputValidation inputValidation = InputValidation();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;
  bool isRememberMe = false;

  requestLogin() async {
    setState(ViewState.busy);
    try {
      response = await authService.loginWithEmailAndPassword(loginBody);
    } catch (e, s) {
      log.d("@LoginViewModel requestLogin Exceptions : $e");
      log.d(s);
    }
    setState(ViewState.idle);
  }

  toggleIsRememberMe() {
    debugPrint('@toggleIsRememberMe: isRememberMe: $isRememberMe');
    isRememberMe = !isRememberMe;
    notifyListeners();
  }

  togglePasswordVisibility() {
    setState(ViewState.busy);
    passwordVisibility = !passwordVisibility;
    setState(ViewState.idle);
  }
}
