class ModelAsociacion {
  int? id;
  String nome;

  ModelAsociacion({this.id, required this.nome});

  factory ModelAsociacion.fromMap(Map<String,dynamic> tabla){
    return ModelAsociacion(nome: tabla['nome'],id: tabla['id']);
  }

  Map<String,dynamic> toMap(){
    return {
      'id': this.id,
      'nome': this.nome
    };
  }
}