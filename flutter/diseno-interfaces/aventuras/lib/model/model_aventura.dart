class ModelAventura {
  final String titulo;
  final String descripcion;
  final int duracion;
  final String imagen;
  final int? rating;

  const ModelAventura({required this.titulo, required this.descripcion, required this.duracion, required this.imagen, this.rating});

factory ModelAventura.fromjson(Map<String,dynamic> mapa){
  final miModel= ModelAventura(titulo: mapa["titulo"],
   descripcion: mapa["descripcion"], 
   duracion: mapa["duracion"], 
   imagen: mapa["imagen"],
   rating: mapa["rating"]);

   return miModel;
}

}