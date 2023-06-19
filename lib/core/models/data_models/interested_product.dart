import 'package:flutter/material.dart';

class InterestedProduct {
  int? id;
  String? productImage;
  Color? color;
  String? name;
  int? discount;
  double? price;

  InterestedProduct(
      {this.id,
      this.productImage,
      this.color,
      this.name,
      this.price,
      this.discount});
}
