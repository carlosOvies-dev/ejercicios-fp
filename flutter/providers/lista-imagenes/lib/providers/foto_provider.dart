import 'package:flutter/material.dart';

class FotoProvider with ChangeNotifier{
  int _cambios =0;

  int get numCambios => _cambios;

  String _imagen = "";
  String get getImagen => _imagen;
  String _nombreFoto="";
  String get getNombre => _nombreFoto;

  List<String> _listCambios = [];

  List<String> get getLista => _listCambios;
  void setImagen(String imagen,String nombre){
    _imagen = imagen;
    _nombreFoto=nombre;
    notifyListeners();
  }

  

  void addLista(){
    _listCambios.add("Cambio ${_cambios}: ${_nombreFoto}");
    notifyListeners();
  }
  void masCambio(){
    _cambios++;
    notifyListeners();
  }
}