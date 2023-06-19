import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_antonx_boilerplate/core/models/data_models/store_data.dart';
import '../../../core/others/base_view_model.dart';

class StoreViewModel extends BaseViewModel {
  int selectIndex = 0;
  String initialFilter = "All Product";

  var productControler = CarouselController();
  void updateSelectIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }

  void updateInitialFilter(String value) {
    initialFilter = value;
    notifyListeners();
  }

  List<Color> colors = const [
    Color(0xffF6565D),
    Color(0xffFDD446),
    Color(0xff222B45),
    Color(0xffA1DBF5),
  ];

  List<StoreData> storeData = [
    StoreData(
      id: 1,
      productTitle: "All Product",
      items: 233,
    ),
    StoreData(
      id: 2,
      productTitle: "Diapers & Wet Wipes",
      items: 433,
    ),
    StoreData(
      id: 3,
      productTitle: "Bath, Hair & Skin Wipes",
      items: 653,
    ),
    StoreData(
      id: 4,
      productTitle: "Baby Health & Foods",
      items: 765,
    )
  ];
}
