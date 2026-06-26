import 'package:barras_progreso/providers/porcentaje_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CirculoWidget extends StatelessWidget {
const CirculoWidget({ super.key });

  @override
  Widget build(BuildContext context){
    final miProvider = Provider.of<PorcentajeProvider>(context,listen: true);
    int diametro =(miProvider.getPor1 + miProvider.getPor2) * 2;
    return Container(
      height: diametro.toDouble(),
      width: diametro.toDouble(),
      decoration: BoxDecoration(color: Colors.orange,
      shape: BoxShape.circle),

    );
  }
}