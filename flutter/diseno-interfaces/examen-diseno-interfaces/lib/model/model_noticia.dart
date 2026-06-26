class ModelNoticia {
  final String texto;
  final String url;
  final String autor;

  const ModelNoticia({required this.texto, required this.autor, required this.url});

  factory ModelNoticia.fomjson(Map<String,dynamic> mapa){
    return ModelNoticia(texto: mapa["texto"], autor: mapa["autor"], url: mapa["url"]);
  }
  

}