class ModelAlumno {
  int? id;
  String nif;
  String nombre;
  bool repetidor;
  int curso_id;

  ModelAlumno({
    this.id, required this.nif, required this.nombre, required this.repetidor, required this.curso_id
  });

  factory ModelAlumno.fromMap(Map<String,dynamic> tabla){
    return ModelAlumno(
      id: tabla['id'],
      nif: tabla['Nif'] , 
      nombre: tabla['nombre'], 
      repetidor: int.tryParse(tabla['repetidor'].toString())==1 ? true : false,
       curso_id: int.tryParse(tabla['curso_id'].toString())?? -1);
  }

  factory ModelAlumno.empty() => ModelAlumno(nif: "", 
  nombre: "", 
  repetidor: false, 
  curso_id: -1);

  Map<String,dynamic> toMap(){
    return {
      'id': this.id,
      'Nif': this.nif,
      'nombre':this.nombre,
      'repetidor': this.repetidor,
      'curso_id': this.curso_id
    };
  }
}