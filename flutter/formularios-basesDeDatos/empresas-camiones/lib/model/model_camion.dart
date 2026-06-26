class ModelCamion {
  int? id;
  String matricula;
  int cv;
  String estado;
  bool alta_capacidad;
  int asociacion_id;

  ModelCamion({this.id, required this.matricula, required this.alta_capacidad, required this.asociacion_id, required this.cv, required this.estado});

  factory ModelCamion.empty() => ModelCamion(id: null ,matricula: "", alta_capacidad: false, asociacion_id: -1, cv: -1, estado: "");

  factory ModelCamion.fromMap(Map<String,dynamic> tabla){
    return ModelCamion(
      id: tabla['id'],
      matricula: tabla['matricula'], 
    alta_capacidad:int.tryParse(tabla['alta_capacidad'].toString())  == 1 ? true : false, 
    asociacion_id:int.tryParse(tabla['asociacion_id'].toString()) ?? -1   ,
     cv: int.tryParse(tabla['cv'].toString()) ?? -1,
      estado: tabla['estado']);
  }

  Map<String,dynamic> toMap(){
    return {
      'id': this.id,
      'matricula': this.matricula,
      'cv': this.cv,
      'estado': this.estado,
      'alta_capacidad': this.alta_capacidad == true ? 1 :0,
      'asociacion_id': this.asociacion_id
    };
  }
}