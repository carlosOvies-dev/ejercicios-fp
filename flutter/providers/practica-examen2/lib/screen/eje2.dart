

import 'package:examen2/provider/contador_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Eje2 extends StatelessWidget {
const Eje2({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<ContadorProvider>(listen: true, context);
    var mensaje = ModalRoute.of(context)!.settings.arguments as double;
    return Scaffold(
      appBar: AppBar(
        title:  Text('Segundo Ejercicio, ${mensaje} '),
      ),
      body: ListView(
        children:  miProvider.getLista.map((e) => _Elemento(dato: e)).toList(),
        
      ),
    );
  }
}

class _Elemento extends StatelessWidget{
  final String dato;
  const _Elemento({super.key, required this.dato});
  @override
  Widget build(BuildContext context) {
    final miProvider = Provider.of<ContadorProvider>(listen: false,context);
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      onDoubleTap: () => miProvider.eliminar(dato),
      child: Container(
        alignment: Alignment.center,
        child: Text("${dato}"),
      ),
    );
  }
}