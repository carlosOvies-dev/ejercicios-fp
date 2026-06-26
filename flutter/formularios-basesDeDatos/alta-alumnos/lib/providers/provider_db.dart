import 'package:alumnos/model/model_alumno.dart';
import 'package:alumnos/model/model_curso.dart';
import 'package:alumnos/services/services_db.dart';
import 'package:flutter/widgets.dart';

class ProviderDb with ChangeNotifier{
  List<ModelCurso> cursos =[];
  List<ModelAlumno> alumnos =[];

  int? idCursoElegido;

  Future<List<ModelCurso>> getCursos()async{
    cursos = await ServicesDb.miDB.getCursos();
    return cursos;
  }

  Future<List<ModelAlumno>> getALumnos(int id)async{
    alumnos = await ServicesDb.miDB.getALumnos(id);
    notifyListeners();
    return alumnos;
  }

  Future<int> addAlumno (ModelAlumno alumno)async{
    int newID = await ServicesDb.miDB.addAlumno(alumno);
   /* if(idCursoElegido== alumno.curso_id){
      alumnos.add(alumno);
      notifyListeners();
    }*/
     notifyListeners();
    return newID;
  }
  Future<int> deleteAlumno(ModelAlumno alumno)async{
    int afectados = await ServicesDb.miDB.deleteAlumno(alumno);
    //alumnos.removeWhere((alum) => alum.id== alumno.id,);
    notifyListeners();
    return afectados;
  }
  Future<int> updateAlumno(ModelAlumno alumno)async{
    int afectados = await ServicesDb.miDB.updateAlumno(alumno);
    notifyListeners();
    return afectados;
  }
  Future<String> getCurso(int id)async{
    String curso = await ServicesDb.miDB.getCurso(id);
    return curso;
  }

}