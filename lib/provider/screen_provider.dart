import 'package:flutter/foundation.dart';

class FarmingOptionsProvider with ChangeNotifier {
  List<bool> _selectedOptions = List<bool>.filled(8, false); // assuming 8 options
  List<bool> _selectedOptions2 = List<bool>.filled(8, false);
String _landArea = "";

  List<bool> get selectedOptions => _selectedOptions;
  List<bool> get selectedOptions2 => _selectedOptions2;
  String get landArea => _landArea;


  void toggleOption(int index) {
    _selectedOptions[index] = !_selectedOptions[index];
    notifyListeners();
  }

  void toggleOption2(int index) {
    _selectedOptions2[index] = !_selectedOptions2[index];
    notifyListeners();
  }

  void updateLandArea (String newArea){
    _landArea = newArea;
    notifyListeners();
  }


}
