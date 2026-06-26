import 'package:examen_piano/model/model_piano.dart';
import 'package:examen_piano/services/services_db.dart';
import 'package:flutter/widgets.dart';

class ProviderPiano with ChangeNotifier{

  List<ModelPiano> _pianos = [];

  ModelPiano _pianoSeleccionado= ModelPiano.empty();

  List<ModelPiano> get getPianos => _pianos;

  ModelPiano get getSeleccionado => _pianoSeleccionado;

  Future<void> actualizarLista()async{
    _pianos.clear();
    final lista = await ServicesDb.miDB.getPianos();
    _pianos = lista;
    notifyListeners();
  }

  Future<List<ModelPiano>> pianosDB() async{

    final lista = await ServicesDb.miDB.getPianos();

    return lista;
  }

  void seleccionar(ModelPiano piano){
    _pianoSeleccionado = piano;
    notifyListeners();
  }

  Future<int> borrarPiano(ModelPiano piano)async{
    final idBorrado = await ServicesDb.miDB.borrarPiano(piano);
    actualizarLista();
    return idBorrado;
  }

Future<int> addPiano(ModelPiano piano)async{
  final idNuevo = await ServicesDb.miDB.addPiano(piano);
  actualizarLista();
  return idNuevo;
}

 
}