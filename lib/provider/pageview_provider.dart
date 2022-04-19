import 'package:flutter/foundation.dart';

class PageViewProvider extends ChangeNotifier {
  int pageIndex = 0;

  void onChangedPages(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void onTapPages() {
    ++pageIndex;
    notifyListeners();
  }
}
