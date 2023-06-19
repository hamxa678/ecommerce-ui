import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/models/brands_model.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';

class PromoScreenViewModel extends BaseViewModel {
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
}
