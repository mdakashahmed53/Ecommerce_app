import 'package:flutter/material.dart';

class MainNavHolderProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void changeIndex(int index)async{
    _selectedIndex = index;
    notifyListeners();
  }

  void backToHome(){
    changeIndex(0);
  }

  void moveToCategory(){
    changeIndex(1);
  }

}