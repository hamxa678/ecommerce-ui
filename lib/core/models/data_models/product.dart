import 'package:flutter/material.dart';

class Product {
  int? id;
  String? productImage;
  Color? color;
  String? name;
  int? stock;
  double? price;
  String? categroy;
  String? trademark;
  String? origin;
  String? warrantyfrom;
  String? waterproof;
  String? accessoriesinclude;
  String? providedby;
  String? description;

  Product(
      {this.id,
      this.productImage,
      this.color,
      this.name,
      this.price,
      this.stock,
      this.categroy,
      this.trademark,
      this.providedby,
      this.origin,
      this.warrantyfrom,
      this.waterproof,
      this.accessoriesinclude,
      this.description});
}
