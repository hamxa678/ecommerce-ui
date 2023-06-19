import 'package:flutter_antonx_boilerplate/core/others/base_view_model.dart';

class ProfileViewModel extends BaseViewModel {
  bool editingMode = false;

  toggleEditingModeToTrue() {
    editingMode = true;
    notifyListeners();
  }

  toggleEditingModeToFalse() {
    editingMode = false;
    notifyListeners();
  }
}
