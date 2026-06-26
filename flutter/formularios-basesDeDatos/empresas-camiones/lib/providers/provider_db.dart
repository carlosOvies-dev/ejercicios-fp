import 'package:camiones/model/model_asociacion.dart';
import 'package:camiones/model/model_camion.dart';
import 'package:camiones/services/services_db.dart';
import 'package:flutter/widgets.dart';

class ProviderDb with ChangeNotifier{

  List<ModelAsociacion> asociaciones=[];
  List<ModelCamion> camiones=[];
  int idSeleccionado =1;
  List<String> _estados = ['NUEVO','ACEPTABLE','MAL ESTADO'];
  
  List<String> get getEstados => _estados;

  Future<List<ModelAsociacion>> actAsociaicones() async{
    asociaciones = await ServicesDb.miDB.getAsociaciones();
   
    return asociaciones;
    
  }

  Future<List<ModelCamion>> actCamiones(int id)async{
    camiones = await ServicesDb.miDB.getCamiones(id);
 
    return camiones;
  }

  void seleccionar(int indice){
    idSeleccionado = indice;
    notifyListeners();
    actCamiones(indice);
  }

  Future<int> eliminarCamion(ModelCamion camion)async{
    int idborrado= await ServicesDb.miDB.borrarCamion(camion);
    notifyListeners();
    return idborrado;
  }

  Future<int> addCamion(ModelCamion camion)async{
    int idNuevo = await ServicesDb.miDB.addCamion(camion);
    notifyListeners();
    return idNuevo;
  }
}