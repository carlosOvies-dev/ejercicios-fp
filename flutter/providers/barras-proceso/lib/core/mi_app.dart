import 'package:barras_progreso/screens/home/home.dart';
import 'package:barras_progreso/screens/segunda_screen.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "home",
      routes: {
        'home' : (_) => Home(),
        'pantalla1':(_) => SegundaScreen()
      },
      home: Home(),
    );
  }
}