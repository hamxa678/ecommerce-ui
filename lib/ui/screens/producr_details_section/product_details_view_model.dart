import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/models/data_models/product.dart';
import 'package:flutter_antonx_boilerplate/core/models/data_models/reviews.dart';

import '../../../core/models/data_models/interested_product.dart';
import '../../../core/models/data_models/viewed_product.dart';
import '../../../core/others/base_view_model.dart';

class ProductDetailsViewModel extends BaseViewModel {
  int selectIndex = 0;
  int selectSideArrow = 0;
  int productIndex = 0;
  int selectSize = 0;
  int quantity = 01;
  int selectQuantity = 1;
  var productControler = CarouselController();
  void updateSelectIndex(int value) {
    selectIndex = value;
    notifyListeners();
  }

  void updateSelectSize(int value) {
    selectSize = value;
    notifyListeners();
  }

  void updateSelectQuantity(int value) {
    selectQuantity = value;
    if (quantity == 1 && value == -1) {
    } else {
      quantity = value + quantity;
    }
    notifyListeners();
  }

  void updateSelectSideArrow(int value) {
    selectSideArrow = value;
    notifyListeners();
  }

  void updateProductIndex(int value) {
    productIndex = value;
    productControler.jumpToPage(value);
    notifyListeners();
  }

  List<Product> dummyProducts = [
    Product(
        id: 0,
        productImage: "assets/images/static_images/shoes1.png",
        color: Colors.red,
        name: "Velona cuddles super dry",
        stock: 5,
        price: 67.99,
        categroy: "Technological",
        trademark: "Air Jodan",
        origin: "Made in USA",
        warrantyfrom: "Electronic Device",
        waterproof: "No",
        accessoriesinclude: "Shoe laces,shoelaces,without socks",
        providedby: 'Shoe Store',
        description:
            "A product description is the marketing copy that explains what a product is and why it's worth purchasing. The purpose of a product description is to supply customers with important information about the features and key benefits of the product so they're compelled to buy why it's worth purchasing. The purpose of a product description is to supply customers with important information about the features and key benefits of the product so they're compelled to buy"),
    Product(
      id: 1,
      productImage: "assets/images/static_images/shoes2.png",
      color: Colors.black,
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.00,
    ),
    Product(
      id: 2,
      productImage: "assets/images/static_images/shoes3.png",
      color: Colors.blue,
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.00,
    ),
    Product(
      id: 3,
      productImage: "assets/images/static_images/shoes3.png",
      color: Colors.green,
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.00,
    ),
    Product(
      id: 4,
      productImage: "assets/images/static_images/shoes4.png",
      color: Colors.pink,
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.00,
    ),
    Product(
      id: 5,
      productImage: "assets/images/static_images/shoes5.png",
      color: Colors.yellow,
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.00,
    ),
    Product(
      id: 6,
      productImage: "assets/images/static_images/shoes6.png",
      color: Colors.greenAccent,
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.00,
    ),
  ];
  List<ViewedProduct> dummyViewedProduct = [
    ViewedProduct(
      id: 1,
      productImage: "assets/images/static_images/vproduct1.png",
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.99,
    ),
    ViewedProduct(
      id: 1,
      productImage: "assets/images/static_images/vproduct2.png",
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.99,
    ),
    ViewedProduct(
      id: 1,
      productImage: "assets/images/static_images/vproduct3.png",
      name: "Velona cuddles super dry",
      stock: 5,
      price: 67.99,
    ),
  ];
  List<InterestedProduct> dummyInterestedProduct = [
    InterestedProduct(
      id: 1,
      productImage: "assets/images/static_images/iproduct1.png",
      name: "Camera Sony DSC RX1000 M3",
      discount: 15,
      price: 678.99,
    ),
    InterestedProduct(
      id: 1,
      productImage: "assets/images/static_images/iproduct2.png",
      name: "Velona cuddles super dry",
      discount: 52,
      price: 567.99,
    ),
    InterestedProduct(
      id: 1,
      productImage: "assets/images/static_images/iproduct3.png",
      name: "Velona cuddles super dry",
      discount: 25,
      price: 467.99,
    ),
  ];
  List<Reviews> reviews = [
    Reviews(
      id: 1,
      imageURL: "assets/images/static_images/Image.png",
      name: "Katy Langford",
      date: "2 september",
      review:
          "A product review is content that examines the benefits and downsides of a specific product or service.",
      stars: 4,
      heart: 10,
      message: 400,
    ),
    Reviews(
      id: 1,
      imageURL: "assets/images/static_images/Image.png",
      name: "Katy Langford",
      date: "2 september",
      review:
          "A product review is content that examines the benefits and downsides of a specific product or service.",
      stars: 4,
      heart: 10,
      message: 400,
    )
  ];
}
