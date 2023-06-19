import 'package:flutter/material.dart';
import 'package:flutter_antonx_boilerplate/core/enums/view_state.dart';
import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/category/category_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/home/home_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/profile_screen/profile_screen.dart';
import 'package:flutter_antonx_boilerplate/ui/screens/promo/promo_screen.dart';

class RootScreenViewModel extends BaseViewModel {
  List<Widget> allScreen = [
    const HomeScreen(),
    const CategoryScreen(),
    const PromoScreen(),
    const ProfileScreen(),
  ];
  int selectedScreen = 0;

  bool isEnableBottomBar = true;

  updatedScreenIndex(int index) {
    setState(ViewState.busy);
    selectedScreen = index;
    setState(ViewState.idle);
  }

  updateBottomBarStatus(bool val) {
    isEnableBottomBar = val;
    notifyListeners();
  }
}
