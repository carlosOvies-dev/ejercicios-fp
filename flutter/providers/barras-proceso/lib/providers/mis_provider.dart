import 'package:barras_progreso/core/mi_app.dart';
import 'package:barras_progreso/providers/porcentaje_provider.dart';
import 'package:barras_progreso/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MisProvider extends StatelessWidget {
const MisProvider({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => PorcentajeProvider(),)
    ],
    child: MiApp(),);
  }
}