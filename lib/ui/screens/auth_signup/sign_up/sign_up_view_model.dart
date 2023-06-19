import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/signup_body.dart';
import 'package:flutter_antonx_boilerplate/core/models/dropdown_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/auth_response.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/core/services/auth_service.dart';
import 'package:flutter_antonx_boilerplate/core/services/file_picker_service.dart';
import 'package:flutter_antonx_boilerplate/locator.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/dialogs/auth_dialog.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/root/root_screen.dart';
import 'package:get/get.dart';


class SignUpViewModel extends BaseViewModel {
  String? dropdownValue;
  String? flagPath;
  int? selectedGenderIndex;

  late AuthResponse response;
  bool checkBoxValue = false;

  SignUpViewModel() {
    dropdownValue = data[0].countryName;
    flagPath = data[0].imagePath;
  }

  SignUpBody signUpBody = SignUpBody();
  final AuthService _authService = locator<AuthService>();
  final FilePickerService _imagePickerService = locator<FilePickerService>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;

  List<DropDownModel> data = [
    DropDownModel("${staticAssetsPath}pak.jpeg", "Pakistan"),
    DropDownModel("${staticAssetsPath}usa.jpg", "USA"),
    DropDownModel("${staticAssetsPath}UK.jpg", "UK"),
    DropDownModel("${staticAssetsPath}India.jpeg", "India")
  ];

  togglePasswordVisibility() {
    setState(ViewState.busy);
    passwordVisibility = !passwordVisibility;
    setState(ViewState.idle);
  }

  toggleCheckBox() {
    setState(ViewState.busy);
    checkBoxValue = !checkBoxValue;
    notifyListeners();
    setState(ViewState.idle);
  }

  toggleCountry(value) {
    dropdownValue = value!;
    notifyListeners();
  }

  updateIndex(val) {
    selectedGenderIndex = val;
    notifyListeners();
  }

  requestSignUp() async {
    setState(ViewState.busy);
    signUpBody.gender = selectedGenderIndex == 0 ? "Male" : "Female";
    response = await _authService.signupWithEmailAndPassword(signUpBody);
    if (!response.success) {
      Get.dialog(const AuthDialog(title: 'Title', message: 'Message here...'));
    } else {
      Get.offAll(const RootScreen());
    }
    setState(ViewState.idle);
  }

  pickImage() async {
    signUpBody.image = await _imagePickerService.pickImage();
    notifyListeners();
  }
}
