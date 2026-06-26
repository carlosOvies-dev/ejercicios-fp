import 'package:flutter_application_1/model/model_noticia.dart';
import 'package:flutter_application_1/services/services_noticia.dart';

class ProvidersNoticia {

  Future<List<ModelNoticia>> miLista() async{

    var listaMapa = await miServices.miJson();

    return listaMapa.map((cadaMapa) => ModelNoticia.fomjson(cadaMapa),).toList();
  }
}

final miProvider = ProvidersNoticia();