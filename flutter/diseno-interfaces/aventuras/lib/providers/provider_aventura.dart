import 'package:aventuras_exoticas/model/model_aventura.dart';
import 'package:aventuras_exoticas/services/services_aventura.dart';

class ProviderAventura {

  Future<List<ModelAventura>> miLista() async{

    var mapas = await miService.miJson();

    return mapas.map((cadaMapa) {
      return ModelAventura.fromjson(cadaMapa);
    },).toList();
  }
}

final miProviders = ProviderAventura();