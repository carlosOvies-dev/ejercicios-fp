import 'package:exame_venom/screens/home/home_examen.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeExamen(),
    );
  }
}