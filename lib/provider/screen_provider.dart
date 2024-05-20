/*import 'package:flutter/material.dart';

class McqProvider with ChangeNotifier {
  int? selectedOptionPage1;
  int? selectedOptionPage2;

  void selectOptionPage1(int index) {
    selectedOptionPage1 = index;
    notifyListeners();
  }

  void selectOptionPage2(int index) {
    selectedOptionPage2 = index;
    notifyListeners();
  }
}*/
import 'package:flutter/material.dart';

class McqProvider with ChangeNotifier {
  List<int> selectedOptionsPage1 = [];
  int? selectedOptionPage2;

  void toggleOptionPage1(int index) {
    if (selectedOptionsPage1.contains(index)) {
      selectedOptionsPage1.remove(index);
    } else {
      selectedOptionsPage1.add(index);
    }
    notifyListeners();
  }

  void selectOptionPage2(int index) {
    selectedOptionPage2 = index;
    notifyListeners();
  }
}
