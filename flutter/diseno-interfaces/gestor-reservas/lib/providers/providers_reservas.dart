import 'package:reservas/model/model_reservas.dart';
import 'package:reservas/services/services_reservas.dart';

class ProvidersReservas {

  Future<List<ModelReservas>> listaReservas() async{

    var listaMapas = await miServices.miJson();

    return listaMapas.map((cadaMapa) => ModelReservas.fromjson(cadaMapa),).toList();

  }

}

final miProviders = ProvidersReservas();