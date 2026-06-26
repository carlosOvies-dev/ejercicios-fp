import 'package:camiones/screen/formulario.dart';
import 'package:camiones/screen/home/home.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: 'home',
      routes: {
        'home': (context) => Home(),
        'formulario': (context) => Formulario()
      },
    );
  }
}