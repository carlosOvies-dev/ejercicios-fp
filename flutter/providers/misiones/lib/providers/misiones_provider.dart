import 'package:flutter/widgets.dart';

class MisionesProvider with ChangeNotifier{

  List<String> _misiones = ["Recolectar", "Cazar", "Explorar", "Defender", "Transportar"];

  List<String> _usuarios = ["Ana", "Pedro", "Luis", "Maria"];

        List<int> _indices =[-1,-1,-1,-1];

  List<int> _ciclos=[0,0,0,0];

   List<int> get getCiclos => _ciclos;

  List<String> get getMisiones => _misiones;

  List<String> get getUsuarios => _usuarios;

  List<int> get getIndices => _indices;

  int _seleccionado = -1;

  int get getSeleccionado => _seleccionado;


  void setSeleccionado(int i){
    _seleccionado=i;
    notifyListeners();
  }
  void darMision(int usuario){
    comprobarMision(usuario);
    
    if(_ciclos[usuario]< 3){

    if(_indices[usuario]==-1){
      _indices[usuario] =0;
      notifyListeners();

    }else{
    _indices[usuario]+=1;

    notifyListeners();
    }
    }
  }

  void comprobarMision(int usuario){
    if(_indices[usuario]==4){
      _ciclos[usuario]++;
      _indices[usuario]= -1;
      notifyListeners();
    }
  }

  
  
}