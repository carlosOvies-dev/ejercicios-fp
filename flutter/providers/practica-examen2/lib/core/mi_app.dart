import 'package:examen2/screen/eje2.dart';
import 'package:examen2/screen/home/eje1.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: 'eje1',
      routes:{
        'eje1': (x) => Eje1(),
        'eje2':(x) => Eje2()
      } ,
     
    );
  }
}