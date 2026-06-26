import 'dart:math';

import 'package:flutter/widgets.dart';

class ContadorProvider with ChangeNotifier{
  List<String> _datos = ["Juan","Angel","Marta"];
   int _sumas=0;
   int _restas=0;
  double _tamano=50;
  int get getSumas => _sumas;
  int get getRestas => _restas;
  double get getTam => _tamano;

  List<String> get getLista => _datos;
  void aumentar(){
    _sumas ++;
    _tamano +=50;
    notifyListeners();
  }
  void restar(){
    _restas ++;
    _tamano-=20;
    notifyListeners();
  }
  
  void eliminar( String dato){
    _datos.remove(dato);
    notifyListeners();
  }

}