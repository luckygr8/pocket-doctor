import 'package:flutter/material.dart';

class SManageIndex extends ChangeNotifier {
  int _pageIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  int get index => _pageIndex;

  PageController get controller => _pageController;

  void changePage(int value) {
    _pageController.jumpToPage(value);
    _pageIndex = value;
    notifyListeners();
  }
}
