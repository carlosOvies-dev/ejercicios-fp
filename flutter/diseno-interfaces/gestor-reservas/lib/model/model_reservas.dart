class ModelReservas {
final String tipo;
final String? nombre;
final String? ubicacion;
final double? rating;
final String? imagen;
final List<String>? servicios;
final String? origen;
final String? destino;
final String? fecha;
final String? estado;

const ModelReservas({ required this.tipo,
this.destino,this.estado,this.fecha,this.imagen,this.nombre,this.origen,this.rating,this.servicios,this.ubicacion});


factory ModelReservas.fromjson(Map<String,dynamic> mapa){

  return ModelReservas(imagen: mapa["imagenUrl"],
   nombre: mapa["nombre"], 
  rating: mapa["rating"] == null ? null : double.tryParse(mapa["rating"]),
   servicios: mapa["servicios"] == null ? null : List<String>.from(mapa["servicios"]), 
  tipo: mapa["tipo"],
   ubicacion: mapa["ubicacion"],
   destino: mapa["destino"], 
   estado: mapa["estado"],
   fecha: mapa["fecha"],
   origen: mapa["origen"]);


}

}