import 'package:examen_peliculas/model/model_pelicula.dart';
import 'package:examen_peliculas/services/services_pelicula.dart';

class ProvidersPelicula {

  Future<List<ModelPelicula>> listaPeliculas() async{

    var listaMapas = await miServices.miJson();

    return listaMapas.map((cadaMapa) => ModelPelicula.fromjson(cadaMapa)).toList();
  }
}

final miProvider = ProvidersPelicula();