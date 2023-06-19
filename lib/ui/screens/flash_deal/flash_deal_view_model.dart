import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/core/services/auth_service.dart';

import '../../../../locator.dart';
import '../../../core/constants/strings.dart';
import '../../../core/models/big_card_model.dart';
import '../../../core/models/brands_model.dart';
import '../../../core/models/flash_deal_times_model.dart';

class FlashDealViewModel extends BaseViewModel {
  AuthService authService = locator<AuthService>();

  List<FlashDealsTimesModel> flashDealsTimesData = [
    FlashDealsTimesModel(time: '08:00', title: "Done Flash"),
    FlashDealsTimesModel(time: '12:00', title: "Ongoing"),
    FlashDealsTimesModel(time: '00:28', title: "Next Flash"),
    FlashDealsTimesModel(time: '00:28', title: "Next Flash"),
  ];

  List<BrandModel> brandsData = [
    BrandModel(
      image: '${staticAssetsPath}nikon.png',
      title: 'Nikon',
    ),
    BrandModel(
      image: '${staticAssetsPath}sony.png',
      title: 'Sony',
    ),
    BrandModel(
      image: '${staticAssetsPath}fuji.png',
      title: 'FujiFilm',
    ),
  ];

  List<BigCard> bigCardData = [
    BigCard(
        image: '${staticAssetsPath}FD1.png',
        title: 'Fujifilm\nInstax Mini 9',
        newPrice: '\$367.00',
        discount: "-24%",
        totalProduct: "5k",
        productSold: "4k"),
    BigCard(
        image: '${staticAssetsPath}FD2.png',
        title: 'Nikon\nCoolpix B500',
        newPrice: '\$67.00',
        discount: "-64%",
        totalProduct: "5k",
        productSold: "4k"),
    BigCard(
        image: '${staticAssetsPath}FD3.png',
        title: 'Camera Nikon\nD5000',
        newPrice: '\$367.00',
        discount: "-24%",
        totalProduct: "5k",
        productSold: "4k"),
    BigCard(
        image: '${staticAssetsPath}FD3.png',
        title: 'Camera Nikon\nD5000',
        newPrice: '\$367.00',
        discount: "-24%",
        totalProduct: "5k",
        productSold: "4k"),
    BigCard(
        image: '${staticAssetsPath}FD1.png',
        title: 'Fujifilm\nInstax Mini 9',
        newPrice: '\$367.00',
        discount: "-24%",
        totalProduct: "5k",
        productSold: "4k"),
    BigCard(
        image: '${staticAssetsPath}FD2.png',
        title: 'Nikon\nCoolpix B500',
        newPrice: '\$67.00',
        discount: "-64%",
        totalProduct: "5k",
        productSold: "4k"),
  ];
}
