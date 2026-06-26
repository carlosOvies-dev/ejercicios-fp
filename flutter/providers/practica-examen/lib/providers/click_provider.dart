import 'package:flutter/material.dart';

class ClickProvider with ChangeNotifier{
  int total_click=0;
  List<String> lista= [];
  int get Total => total_click;

  void reseteo(){
    total_click=0;
    lista.clear();
    notifyListeners();
  }

  void sumar(){
    total_click++;
    lista.add("Click numero ${total_click}");
    notifyListeners();
    
  }

  
}