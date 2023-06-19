import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';
import 'package:flutter_antonx_boilerplate/core/models/debit_card_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/ready_to_check_out_model.dart';

List<ReadyToCheckOutModel> readyToCheckOutModelData = [
  ReadyToCheckOutModel(
      imageURL: '${staticImagesAssetsPath}R2CO1.png',
      title: "Giày Nike Air Jordan 1 Bred",
      sizeLength: "xl",
      price: 176.4),
  ReadyToCheckOutModel(
      imageURL: '${staticImagesAssetsPath}R2CO2.png',
      title: "Nike Air jordan 4 Travis Scott",
      sizeLength: "l",
      price: 134.4)
];

List<DebitCardDetail> debitCardDetailData = [
  DebitCardDetail(
      cardNo: 7385139396437921,
      phoneNo: 03369913886,
      email: 'hamxa678@gmail.com',
      name: 'Hamza Khan'),
  DebitCardDetail(
      cardNo: 9987136394537524,
      phoneNo: 03369913886,
      email: 'hamxa678@gmail.com',
      name: 'Mohsin Bangash'),
];

int? selectedCardIndex;
