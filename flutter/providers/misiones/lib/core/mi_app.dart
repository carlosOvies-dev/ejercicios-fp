import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:misiones/screen/home/home.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
    );
  }
}