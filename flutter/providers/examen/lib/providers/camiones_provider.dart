import 'package:examen/model/camion.dart';
import 'package:flutter/widgets.dart';

class CamionesProvider with ChangeNotifier{
 final Camion c1 = Camion(matricula: "ABCD123", alta_capacidad: true);
 final Camion c2 = Camion(matricula: "DFG456", alta_capacidad: false);
 final Camion c3 = Camion(matricula: "LKJ789", alta_capacidad: true);
 final Camion c4 = Camion(matricula: "YUI987", alta_capacidad: false);

  late List<Camion> _camiones =[c1,c2,c3,c4];
 List<Camion> _borrados=[];
 List<Camion> get getCamiones=> _camiones;
List<Camion> get getBorrados => _borrados;
 void borrar(Camion camion){
  _borrados.add(camion);
  _camiones.remove(camion);
  notifyListeners();
 }

 void addCamion(Camion camion){
  _camiones.add(camion);
  _borrados.remove(camion);
  notifyListeners();
 }
}