import 'package:flutter/foundation.dart';

class BottomNavigationProvider extends ChangeNotifier {
  int selectedIndex = 0;

  void onTapedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }
}
