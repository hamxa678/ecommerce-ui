import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/body/signup_body.dart';
import 'package:flutter_antonx_boilerplate/core/models/responses/auth_response.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/core/services/auth_service.dart';
import 'package:flutter_antonx_boilerplate/core/services/file_picker_service.dart';
import 'package:flutter_antonx_boilerplate/ui/custom_widgets/dialogs/auth_dialog.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/root/root_screen.dart';
import 'package:get/get.dart';

import '../../../../../locator.dart';
import '../../../core/constants/strings.dart';
import '../../../core/models/featured_card_model.dart';
import '../../../core/models/category_model.dart';
import '../../../core/models/promotion_item.dart';
import '../../../core/models/topkeysearch_model.dart';

class ProductSearchModel extends BaseViewModel {
  List<FeaturedCardModel> featuredCardData = [
    FeaturedCardModel(
        backGroundImage: '${staticAssetsPath}BackGroundImage.png',
        title: 'Up To 50% Off Holiday Bit',
        images: SubImages(
            image1: "${staticAssetsPath}SubImage1.png",
            image2: "${staticAssetsPath}SubImage2.png",
            image3: "${staticAssetsPath}SubImages3.png")),
    FeaturedCardModel(
        backGroundImage: '${staticAssetsPath}BackGroundImage.png',
        title: 'Up To 50% Off Holiday Bit',
        images: SubImages(
            image1: "${staticAssetsPath}SubImage1.png",
            image2: "${staticAssetsPath}SubImage2.png",
            image3: "${staticAssetsPath}SubImages3.png")),
  ];

  List<TopKeySearchModel> topKeySearchData = [
    TopKeySearchModel(
        title: "Men",
        quantity: "(35k product)",
        images: "${staticAssetsPath}TKS1.png"),
    TopKeySearchModel(
        title: "Women",
        quantity: "(35k product)",
        images: "${staticAssetsPath}TKS2.png"),
    TopKeySearchModel(
        title: "Jeans",
        quantity: "(35k product)",
        images: "${staticAssetsPath}TKS3.png"),
  ];

  List<CategoryModel> categoryData = [
    CategoryModel(
        "Apparel", const Color(0xff4E55AF), '${staticAssetsPath}Apparel.svg'),
    CategoryModel("Electronics", const Color(0xff6EA2FF),
        '${staticAssetsPath}Electronics.svg'),
    CategoryModel(
        "Books", const Color(0xffF9A1DA), '${staticAssetsPath}Books.svg'),
    CategoryModel(
        "Health", const Color(0xff00D2E0), '${staticAssetsPath}Health.svg'),
    CategoryModel("Flash Sale", const Color(0xffF6565D),
        '${staticAssetsPath}Flash Sale.svg'),
    CategoryModel("Furniture", const Color(0xffFDD446),
        '${staticAssetsPath}Furniture.svg'),
    CategoryModel(
        "Food", const Color(0xffFF840D), '${staticAssetsPath}Food.svg'),
    CategoryModel(
        "Fashion", const Color(0xff7B60EE), '${staticAssetsPath}Fashion.svg'),
  ];

  List<PromotionItemsModel> promotionItemData = [
    PromotionItemsModel("Wireless\nController PS4™", '\$278.00', '-54%',
        '${staticAssetsPath}product 1.png'),
    PromotionItemsModel("T-shirt Men\nUniquilo", '\$378.00', '-60%',
        '${staticAssetsPath}product 2.png'),
    PromotionItemsModel("Double Bed\nMolti Foam", '\$2378.00', '-50%',
        '${staticAssetsPath}product 3.png'),
  ];

  // T0D0: Model is to be created for recentSearchData
  List<String> recentSearchData = [
    'Summer dress',
    'Summer beach wear',
    "Children's hats",
    'Doice & Babana'
  ];

  final AuthService _authService = locator<AuthService>();
  final FilePickerService _imagePickerService = locator<FilePickerService>();
  int? selectedGenderIndex;
  SignUpBody signUpBody = SignUpBody();
  late AuthResponse response;

  PageController controller = PageController();
  TextEditingController searchController = TextEditingController();

  bool passwordVisibility = true;
  bool pageRoute = false;

  toggleRecent(String value) {
    setState(ViewState.busy);
    searchController.text = value;
    setState(ViewState.idle);
    notifyListeners();
  }

  togglePasswordVisibility() {
    setState(ViewState.busy);
    passwordVisibility = !passwordVisibility;
    setState(ViewState.idle);
  }

  togglePageRoute() {
    setState(ViewState.busy);
    pageRoute = !pageRoute;
    setState(ViewState.idle);
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
