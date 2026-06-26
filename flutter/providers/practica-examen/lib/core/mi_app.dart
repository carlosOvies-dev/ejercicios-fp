import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Home/home.dart';
import 'package:flutter_application_1/screens/ejer1.dart';
import 'package:flutter_application_1/screens/ejer2.dart';

class MiApp extends StatelessWidget {
const MiApp({ super.key });

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Home(),
    );
  }
}