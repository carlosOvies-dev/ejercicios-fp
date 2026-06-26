import 'package:exame_venom/model/model_actores.dart';
import 'package:exame_venom/services/services_actores.dart';

class ProvidersActores {

  Future<List<ModelActores>> miLista ()async{
    var mapa = await miServices.miJson();

    return mapa.map((cadaMapa) => ModelActores.fromjson(cadaMapa),).toList();
  }
}

final miProvider = ProvidersActores();