class ModelCurso {
  int? id;
  String nombre;
  ModelCurso({this.id, required this.nombre});

  factory ModelCurso.fromMap(Map<String,dynamic> tabla){
    return ModelCurso(
      id: tabla['id'],
      nombre: tabla['nombre']);
  }

  Map<String,dynamic> toMap(){
    return {
      'id': this.id,
      'nombre': this.nombre
    };
  }
}