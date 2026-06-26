import 'package:aventuras_exoticas/screens/home/home_aventura.dart';
import 'package:flutter/material.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: HomeAventura(),
    );
  }
}