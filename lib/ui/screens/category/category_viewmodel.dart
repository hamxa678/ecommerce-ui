import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/models/brands_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/detail_card_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/filter_item_model.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/core/others/logger_customizations/custom_logger.dart';
import '../../../core/constants/strings.dart';
import '../../../core/models/category_model.dart';
import '../../../core/models/notification_card_model.dart';
import '../../../core/models/promotion_item.dart';
import '../../../core/models/sub_category_model.dart';
import '../home/home_viewmodel.dart';

class CategoryViewModel extends BaseViewModel {
  final log = CustomLogger(className: 'CategoryViewModel');
  List<CategoryModel> categoryData = HomeViewModel().categoryData;

  PageController controller = PageController();

  String? initialFilter;
  bool filterFlag = false;
  toggleToAllProduct() {
    setState(ViewState.busy);
    filterFlag = false;
    initialFilter = "All Product";
    setState(ViewState.idle);
  }

  toggleCheckBox(value) {
    initialFilter = value;
    filterFlag = true;
    log.d(initialFilter);

    notifyListeners();
  }

  List<FilterItems> filterItemsData = [
    FilterItems(title: "All Product", noOfItems: 1346),
    FilterItems(title: "Diapers & Wet Wipes", noOfItems: 573),
    FilterItems(title: "Bath, Hair & Skin Care", noOfItems: 436),
    FilterItems(title: "Baby Health & Foods", noOfItems: 456),
  ];

  List<SubCategoryModel> subCategoryData = [
    SubCategoryModel(
        categoryTitle: "Smart phone",
        images: Images(
            image1: "${staticAssetsPath}SCSP1.png",
            image2: "${staticAssetsPath}SCSP2.png",
            image3: "${staticAssetsPath}SCSP3.png")),
    SubCategoryModel(
        categoryTitle: "Smart TV",
        images: Images(
            image1: "${staticAssetsPath}SCST1.png",
            image2: "${staticAssetsPath}SCST2.png",
            image3: "${staticAssetsPath}SCST3.png")),
    SubCategoryModel(
        categoryTitle: "Laptop",
        images: Images(
            image1: "${staticAssetsPath}SCL1.png",
            image2: "${staticAssetsPath}SCL2.png",
            image3: "${staticAssetsPath}SCL3.png")),
    SubCategoryModel(
        categoryTitle: "Tablet",
        images: Images(
            image1: "${staticAssetsPath}SCT1.png",
            image2: "${staticAssetsPath}SCT2.png",
            image3: "${staticAssetsPath}SCT3.png")),
    SubCategoryModel(
        categoryTitle: "Headphone",
        images: Images(
            image1: "${staticAssetsPath}SCH1.png",
            image2: "${staticAssetsPath}SCH2.png",
            image3: "${staticAssetsPath}SCH3.png")),
    SubCategoryModel(
        categoryTitle: "Camera",
        images: Images(
            image1: "${staticAssetsPath}SCC1.png",
            image2: "${staticAssetsPath}SCC2.png",
            image3: "${staticAssetsPath}SCC3.png")),
  ];

  List<NotificationCardModel> notificationCardData = [
    NotificationCardModel(
        "FlASH SALE Haloween",
        "Stay tune and check your notif everyday",
        "6 hours",
        "${staticAssetsPath}image.png"),
    NotificationCardModel(
        "Eid Mubarak FLASH SALE",
        "Stay tune and check your notif everyday",
        "56 hours",
        "${staticAssetsPath}Eid.jpg"),
    NotificationCardModel(
        "Ramadan FLASH SALE",
        "Stay tune and check your notif everyday",
        "30 days",
        "${staticAssetsPath}ramadan.jpg")
  ];

  // ignore: todo
  // TODO: Separate model for Flash Sales data of category screen

  List<PromotionItemsModel> flashSaleData = [
    PromotionItemsModel("Wireless\nController PS4™", '\$278.00', '-54%',
        '${staticAssetsPath}product 1.png'),
    PromotionItemsModel("T-shirt Men\nUniquilo", '\$378.00', '-60%',
        '${staticAssetsPath}product 2.png'),
    PromotionItemsModel("Women Gucci\nPurse FJ8", '\$378.00', '-80%',
        '${staticAssetsPath}FS1.png'),
    PromotionItemsModel("Headphone\nElogin HF01", '\$278.00', '-64%',
        '${staticAssetsPath}FS2.png'),
    PromotionItemsModel("T-shirt Men\nUniquilo", '\$378.00', '-60%',
        '${staticAssetsPath}product 2.png'),
  ];

  // ignore: todo
  // TODO: Separate model for Just For You data of category screen

  List<PromotionItemsModel> justForYouData = [
    PromotionItemsModel("Headphone\nElogin HF01", '\$278.00', '-54%',
        '${staticAssetsPath}JF1.png'),
    PromotionItemsModel("Canon Powershot\nG9 X Mark II ", '\$378.00', '-60%',
        '${staticAssetsPath}JF2.png'),
    PromotionItemsModel("T-shirt Men\nUniquilo", '\$378.00', '-80%',
        '${staticAssetsPath}JF3.png'),
    PromotionItemsModel("Headphone\nElogin HF01", '\$278.00', '-64%',
        '${staticAssetsPath}FS2.png'),
    PromotionItemsModel("T-shirt Men\nUniquilo", '\$378.00', '-60%',
        '${staticAssetsPath}product 2.png'),
  ];

  List<DetailedCardModel> detailedCardData = [
    DetailedCardModel(
        title: "Canon Powershot G9 X Mark II",
        rating: 4.7,
        noOfRating: 3,
        newPrice: 367.00,
        discountPercentage: -24,
        imageURL: "${staticImagesAssetsPath}HPDC1.png",
        installmentPercent: 0),
    DetailedCardModel(
        title: "Canon Powershot G9 X Mark II",
        rating: 4.7,
        noOfRating: 3,
        newPrice: 367.00,
        discountPercentage: -24,
        imageURL: "${staticImagesAssetsPath}HPDC2.png",
        installmentPercent: 0),
    DetailedCardModel(
        title: "Canon Powershot G9 X Mark II",
        rating: 4.7,
        noOfRating: 3,
        newPrice: 367.00,
        discountPercentage: -24,
        imageURL: "${staticImagesAssetsPath}HPDC3.png",
        installmentPercent: 0),
    DetailedCardModel(
        title: "Canon Powershot G9 X Mark II",
        rating: 4.7,
        noOfRating: 3,
        newPrice: 367.00,
        discountPercentage: -24,
        imageURL: "${staticImagesAssetsPath}HPDC4.png",
        installmentPercent: 0),
    DetailedCardModel(
        title: "Canon Powershot G9 X Mark II",
        rating: 4.7,
        noOfRating: 3,
        newPrice: 367.00,
        discountPercentage: -24,
        imageURL: "${staticImagesAssetsPath}HPDC5.png",
        installmentPercent: 0),
    DetailedCardModel(
        title: "Canon Powershot G9 X Mark II",
        rating: 4.7,
        noOfRating: 3,
        newPrice: 367.00,
        discountPercentage: -24,
        imageURL: "${staticImagesAssetsPath}HPDC6.png",
        installmentPercent: 0),
  ];

  List<BrandModel> brandsData = [
    BrandModel(
      image: '${staticImagesAssetsPath}HPB1.png',
      title: 'Nikon',
    ),
    BrandModel(
      image: '${staticImagesAssetsPath}HPB2.png',
      title: 'Sony',
    ),
    BrandModel(
      image: '${staticImagesAssetsPath}HPB3.png',
      title: 'FujiFilm',
    ),
    BrandModel(
      image: '${staticImagesAssetsPath}HPB1.png',
      title: 'Nikon',
    ),
  ];

  // final AuthService _authService = locator<AuthService>();
  // int? selectedGenderIndex;
  // SignUpBody signUpBody = SignUpBody();
  // late AuthResponse response;

}
