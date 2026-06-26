import 'package:flutter/material.dart';

class PorcentajeProvider with ChangeNotifier{
  int _porcentaje1=0;
  int _porcentaje2=0;

  int _numModicifaciones1 =0;
  int _numModicifaciones2 =0;

  int _seleccionado =0;

  int get getPor1 => _porcentaje1;
  int get getPor2 => _porcentaje2;

  int get getMod1 => _numModicifaciones1;
  int get getMod2 => _numModicifaciones2;

  int get getSeleccionado => _seleccionado;

  void aumentarP1(){
    if(_porcentaje1 < 100){
    _porcentaje1 = _porcentaje1 + 10;
    _numModicifaciones1++;
    notifyListeners();
    }
    
  }
  void aumentarP2(){
    if(_porcentaje2 < 100){
    _porcentaje2 = _porcentaje2 + 10;
    _numModicifaciones2++;
    notifyListeners();
    }
    
  }

  void seleccionar(int i){
    if(i ==2){
      _numModicifaciones1=0;
    }
    if(i == 1){
      _numModicifaciones2=0;
    }
    _seleccionado =i;
    notifyListeners();
  }

  void restarP1(){
    if(_porcentaje1 > 0){
    _porcentaje1 = _porcentaje1 -10;
    _numModicifaciones1++;
    notifyListeners();
    }
  }
  void restarP2(){
    if(_porcentaje2 > 0){
    _porcentaje2 = _porcentaje2-10;
    _numModicifaciones2++;
    notifyListeners();
    }

  }

}