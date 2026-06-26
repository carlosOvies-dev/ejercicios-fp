import 'package:examen_peliculas/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}