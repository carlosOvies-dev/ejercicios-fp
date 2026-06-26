import 'package:examen_piano/screen/home/screen_lista.dart';
import 'package:examen_piano/screen/screen_formulario.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        'inicio': (x) => ScreenLista(),
        'formulario':(x) => ScreenFormulario()
      },
      initialRoute: 'inicio',
    );
  }
}