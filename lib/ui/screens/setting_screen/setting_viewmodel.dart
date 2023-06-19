import 'package:flutter/material.dart';

class SettingViewModel extends ChangeNotifier {
  List<bool> upperContainerSwitchData = [false, false, false, false];
  List<bool> lowerContainerSwitchData = [false, false, false, false];

  //UpperContainerData upperContainerSwitchData = UpperContainerData(false, false, false, false);
  List<String> upperContainerData = [
    "Notifications",
    "Ask before buy",
    "Color blind mode",
    "Setup Widget",
  ];

  List<String> lowerContainerData = [
    "Personal communication",
    "Sub Language",
    "Sound",
    "Setup Widget",
  ];

  toggleUpperSwitch(bool value, int index) {
    upperContainerSwitchData[index] = value;
    notifyListeners();
  }

  toggleLowerSwitch(bool value, int index) {
    lowerContainerSwitchData[index] = value;
    notifyListeners();
  }
}

// class UpperContainerData {
//   bool? notifications;
//   bool? askBeforeBuy;
//   bool? colorBlindMode;
//   bool? setupWidget;
//   UpperContainerData(
//     this.notifications,
//     this.askBeforeBuy,
//     this.colorBlindMode,
//     this.setupWidget,
//   );
// }
