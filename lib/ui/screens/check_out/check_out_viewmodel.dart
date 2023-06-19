import 'dart:async';
import 'dart:developer';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_antonx_boilerplate/core/constants/strings.dart';

import 'package:flutter_antonx_boilerplate/core/models/debit_card_model.dart';
import 'package:flutter_antonx_boilerplate/core/models/other_models/dummy_card_data.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/add_address.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/check_out/card_list.dart';
import 'package:flutter_geocoder/geocoder.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CheckOutViewModel extends BaseViewModel {
  bool checkBoxValue = false;

  CheckOutViewModel(BuildContext? context) {
    debitCardDetailVMData = debitCardDetailData;
    addMarker();
    DefaultAssetBundle.of(context!)
        .loadString('assets/images/maptheme/silver.json')
        .then((string) {
      mapTheme = string;
    }).catchError((error) {
      log("error : $error");
    });
  }
  toggleCheckBox() {
    checkBoxValue = !checkBoxValue;
    notifyListeners();
  }

  Marker? marker;
  String mapTheme = '';

  LatLng latlong = const LatLng(33.6992161, 72.9744022);
  TextEditingController addCardNameController = TextEditingController();
  TextEditingController addCardPhoneNoController = TextEditingController();
  TextEditingController addCardEmailController = TextEditingController();
  TextEditingController addCardCardNoController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  Completer<GoogleMapController> googleMapController = Completer();
  int? selectedCardId = selectedCardIndex;
  List<String> debitCardImage = [
    '${staticImagesAssetsPath}card1.png',
    '${staticImagesAssetsPath}card2.png',
    '${staticImagesAssetsPath}card3.png',
    '${staticImagesAssetsPath}card4.png',
  ];
  List<DebitCardDetail?> debitCardDetailVMData = debitCardDetailData;
  String? paymentMethod;

  togglePaymentMethod(value) {
    paymentMethod = value;
    notifyListeners();
  }

  selectCard() async {
    selectedCardId = await Get.to(CardList());
    notifyListeners();
  }

  addNewCard(BuildContext context, CheckOutViewModel model) async {
    debitCardDetailVMData.add(await Get.to(showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return modalBottomSheet(context, model);
      },
    )));
    notifyListeners();
  }

  addressAlert(BuildContext context, CheckOutViewModel model) async {
    await Get.to(showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return addAddressModalBottomSheet(context, model);
      },
    ));
    notifyListeners();
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  addMarker() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('${staticImagesAssetsPath}Marker.png', 130);
    marker = Marker(
        markerId: const MarkerId("Your Location"),
        position: latlong,
        icon: BitmapDescriptor.fromBytes(markerIcon),
        infoWindow: const InfoWindow(title: 'This is your defined location'));
    notifyListeners();
  }

  getAddress(double latitude, double longitude) async {
    final coordinates = Coordinates(latitude, longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    final first = addresses.first;
    locationController.text = first.addressLine!;

    List<Placemark> placemarks =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemarks[0];
    cityController.text = place.locality!;
    postalCodeController.text = place.postalCode!;
    stateController.text = place.administrativeArea!;
    countryController.text = place.country!;

    notifyListeners();

//    From a query
    // final query = "E11, Islamabad, Pakistan";
    // var add = await Geocoder.local.findAddressesFromQuery(query);
    // var second = add.first;
    // print("${second.featureName} : ${second.coordinates}");
  }

  updateCordinate(LatLng cordinate) {
    latlong = cordinate;
    addMarker();
    getAddress(cordinate.latitude, cordinate.longitude);
    notifyListeners();
  }
}
