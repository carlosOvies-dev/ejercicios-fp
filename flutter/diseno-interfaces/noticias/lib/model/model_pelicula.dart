class ModelPelicula {

  final String titulo;
  final String? desc;
  final String foto;
  final int? comentarios;
  final int? numstars;

  const ModelPelicula({required this.titulo, required this.foto, this.comentarios, this.desc, this.numstars});

  factory ModelPelicula.fromjson(Map<String,dynamic> mapa){
    return ModelPelicula(titulo: mapa["titulo"], 
    foto: mapa["foto"],
    comentarios: mapa["comentarios"] == null ? null : int.tryParse(mapa["comentarios"]),
    desc: mapa["desc"],
    numstars: mapa["numstars"] == null ? null : int.tryParse(mapa["numstars"]));
  }
}