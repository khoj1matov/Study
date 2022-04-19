import 'package:flutter/foundation.dart';

class CheckBoxProvider extends ChangeNotifier {
  bool isChecked = false;

  void onChecked(bool bool) {
    isChecked = bool;
    notifyListeners();
  }
}
