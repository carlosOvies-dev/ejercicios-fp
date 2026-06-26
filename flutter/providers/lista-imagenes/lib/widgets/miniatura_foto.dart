import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/foto_provider.dart';
import 'package:provider/provider.dart';

class MiniaturaFoto extends StatelessWidget {
  final String imagen;
  final String nombre;
const MiniaturaFoto({ super.key, required this.imagen, required this.nombre });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<FotoProvider>(listen: false, context);
    return GestureDetector(
      onTap: () {
        miProvider.setImagen(imagen, nombre);
        miProvider.masCambio();
        miProvider.addLista();
      },
      child: Container(
        width: 70,
        height: 70,
        child: Image.asset(imagen),
      ),
    );
  }
}