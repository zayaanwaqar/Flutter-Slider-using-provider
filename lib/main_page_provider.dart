import 'package:flutter/material.dart';

class MainPageProvider extends ChangeNotifier{
  double? value;

  void getValue(val){
    value = val;
    notifyListeners();
  }


}