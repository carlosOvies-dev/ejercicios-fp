import 'package:examen/screen/home/pantalla1.dart';
import 'package:examen/screen/pantalla2.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: 'p1',
      routes: {
        'p1':(_) => Pantalla1(),
        'p2':(_) => Pantalla2()
      },
    );
  }
}