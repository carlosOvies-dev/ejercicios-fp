class ModelPiano {
  int? id;
  String modelo;
  int? ano_compra;
  bool novo;
  double? prezo;

  ModelPiano({ this.id, required this.modelo, this.ano_compra,required this.novo,this.prezo});

  factory ModelPiano.empty() => ModelPiano(modelo: "", novo: true, ano_compra: null, id: null, prezo: null);

  factory ModelPiano.fromMap(Map<String,dynamic> tabla){
    return ModelPiano(modelo: tabla['modelo'], novo: tabla['novo'] == 1 ? true : false,
    ano_compra: int.tryParse(tabla['ano_compra'].toString()) ,
    id: tabla['id'] ,
    prezo: double.tryParse(tabla['prezo'].toString()) );
  }

  Map<String,dynamic> toMap(){
    return 
      {
        'modelo': this.modelo,
        'ano_compra': this.ano_compra ,
        'novo': this.novo ,
        'prezo': this.prezo 
      }

    ;
  }



}