import 'package:flutter/cupertino.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/models/cart_item_model.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';

class CartViewModel extends BaseViewModel {
  TextEditingController couponController = TextEditingController();
  bool flag = true;

  ///
  /// Cart Item Data
  ///
  List<CartItemCard> cartItemCardData = [
    CartItemCard(
        imageURL: "${staticImagesAssetsPath}c1.png",
        title: 'Growing Up Milk Nan Optipro 3',
        price: 100.00,
        discount: -23,
        noOfAvailableStock: 1),
    CartItemCard(
        imageURL: "${staticImagesAssetsPath}c2.png",
        title: 'Sensitive Baby Bath Wash',
        price: 37.00,
        noOfAvailableStock: 5),
    CartItemCard(
        imageURL: "${staticImagesAssetsPath}c3.png",
        title: 'Happix Baby Diapers jumbo ',
        price: 70.00,
        noOfAvailableStock: 7),
  ];

  
  checkOut() {
    for (int i = 0; i < cartItemCardData.length; i++) {
      if (cartItemCardData[i].noOfAvailableStock == 0) flag = false;
    }
  }
}
